//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/28.
//

import Foundation

struct Bank {
    private let depositClerkCount: Int
    private let loanClerkCount: Int
    private let bankWaitingQueue = BankWaitingQueue.init(LinkedList<Customer>())
    private let bankClerk = BankClerk()
    
    init(depositClerkCount: Int, loanClerkCount: Int) {
        self.depositClerkCount = depositClerkCount
        self.loanClerkCount = loanClerkCount
    }
    
    func startWork() -> (Int, String)? {
        let depositWindow = DispatchSemaphore(value: depositClerkCount)
        let loanWindow = DispatchSemaphore(value: loanClerkCount)
        let group = DispatchGroup()
        let startWorkTime = CFAbsoluteTimeGetCurrent()
        let customers = limitCustomerCount()
     
        while !bankWaitingQueue.isEmpty {
            guard let customer = bankWaitingQueue.dequeue() else { return nil }
            guard let task = customer.task else { return nil }
            
            switch task {
            case .deposit:
                depositWindow.wait()
                DispatchQueue.global().async(group: group) {
                    self.bankClerk.processTask(for: customer)
                    depositWindow.signal()
                }
            case .loan:
                loanWindow.wait()
                DispatchQueue.global().async(group: group) {
                    self.bankClerk.processTask(for: customer)
                    loanWindow.signal()
                }
            }
        }
        group.wait()
        let finishWorkTime = CFAbsoluteTimeGetCurrent() - startWorkTime
        
        return (customers, finishWorkTime.customFloor())
    }
    
    private func limitCustomerCount() -> Int {
        let customers = Int.random(in: 10...30)
        
        for number in 1...customers {
            bankWaitingQueue.enqueue(Customer(numberTicket: number))
        }
        return customers
    }
}

// MARK: - Double extension
private extension Double {
    func customFloor() -> String {
        let digit: Double = pow(10, 1)
        return String(format: "%.2f", floor(self * digit) / digit)
    }
}
