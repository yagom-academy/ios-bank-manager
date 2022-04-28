//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/28.
//

import Foundation

struct Bank {
    private let bankClerkCount: Int
    private let bankWaitingQueue = BankWaitingQueue.init(LinkedList<Customer>())
    private let bankClerk = BankClerk()
    
    init(bankClerkCount: Int) {
        self.bankClerkCount = bankClerkCount
    }
    
    func startWork() -> (Int, String)? {
        let bankWindows = DispatchSemaphore(value: bankClerkCount)
        let group = DispatchGroup()
        let startWorkTime = CFAbsoluteTimeGetCurrent()
     
        while !bankWaitingQueue.isEmpty {
            guard let customer = bankWaitingQueue.dequeue() else { return nil }
            
            DispatchQueue.global().async(group: group) {
                bankWindows.wait()
                self.bankClerk.processTask(for: customer)
                bankWindows.signal()
            }
        }
        group.wait()
        let finishWorkTime = CFAbsoluteTimeGetCurrent() - startWorkTime
        
        return (limitCustomerCount(), finishWorkTime.customFloor())
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
