//
//  Bank.swift
//  BankManagerUIApp
//
//  Created by Donnie, Safari on 2022/05/04.
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
    
    private func startWork() {
        let depositWindowQueue = OperationQueue()
        let loanWindowQueue = OperationQueue()
        
        assignClerkCount(at: depositWindowQueue, and: loanWindowQueue)
        
        while !bankWaitingQueue.isEmpty {
            guard let customer = bankWaitingQueue.dequeue() else { return }
            guard let task = customer.task else { return }
            let operation = BlockOperation {
                self.bankClerk.processTask(for: customer)
            }
            
            task.start(deposit: depositWindowQueue, loan: loanWindowQueue).addOperation(operation)
        }
        waitTillOperationOver(at: depositWindowQueue, and: loanWindowQueue)
    }
    
    func addCustomers() {
        let customers = 10
        
        for number in 1...customers {
            bankWaitingQueue.enqueue(Customer(numberTicket: number))
        }
        startWork()
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
