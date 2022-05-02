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
        let depositWindowQueue = OperationQueue()
        let loanWindowQueue = OperationQueue()
        let startWorkTime = CFAbsoluteTimeGetCurrent()
        let customers = limitCustomerCount()
        
        assignClerkCount(at: depositWindowQueue, and: loanWindowQueue)
     
        while !bankWaitingQueue.isEmpty {
            guard let customer = bankWaitingQueue.dequeue() else { return nil }
            guard let task = customer.task else { return nil }
            
            switch task {
            case .deposit:
                depositWindowQueue.addOperation {
                    self.bankClerk.processTask(for: customer)
                }
            case .loan:
                loanWindowQueue.addOperation {
                    self.bankClerk.processTask(for: customer)
                }
            }
        }
        waitTillOperationOver(at: depositWindowQueue, and: loanWindowQueue)
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

// MARK: - OperationQueue Method
private extension Bank {
    func assignClerkCount(at deposit: OperationQueue, and loan: OperationQueue) {
        deposit.maxConcurrentOperationCount = depositClerkCount
        loan.maxConcurrentOperationCount = loanClerkCount
    }
    
    func waitTillOperationOver(at deposit: OperationQueue, and loan: OperationQueue) {
        deposit.waitUntilAllOperationsAreFinished()
        loan.waitUntilAllOperationsAreFinished()
    }
}

// MARK: - Double extension
private extension Double {
    func customFloor() -> String {
        let digit: Double = pow(10, 1)
        return String(format: "%.2f", floor(self * digit) / digit)
    }
}
