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
    private var currentTicketNumber = 1
    
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
            
            switch task {
            case .deposit:
                depositWindowQueue.addOperation(operation)
            case .loan:
                loanWindowQueue.addOperation(operation)
            }
        }
    }
    
    mutating func addCustomers() -> [Customer] {
        var customers: [Customer] = []
        
        for number in currentTicketNumber..<currentTicketNumber + 10 {
            let customer = Customer(numberTicket: number)
            customers.append(customer)
            bankWaitingQueue.enqueue(customer)
        }
        self.currentTicketNumber += 10
        startWork()
        return customers
    }
}

// MARK: - OperationQueue Method
private extension Bank {
    func assignClerkCount(at deposit: OperationQueue, and loan: OperationQueue) {
        deposit.maxConcurrentOperationCount = depositClerkCount
        loan.maxConcurrentOperationCount = loanClerkCount
    }
}
