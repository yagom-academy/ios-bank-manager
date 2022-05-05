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
    private var currentTicketNumber = 1
    private let depositWindowQueue = OperationQueue()
    private let loanWindowQueue = OperationQueue()
    var bankClerk = BankClerk()
    
    init(depositClerkCount: Int, loanClerkCount: Int) {
        self.depositClerkCount = depositClerkCount
        self.loanClerkCount = loanClerkCount
    }
    
    private func startWork() {
        assignClerkCount()
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
        finishNotity()
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
    
    mutating func resetTicketNumber() {
        self.currentTicketNumber = 1
    }
}

// MARK: - OperationQueue Method
extension Bank {
    private func assignClerkCount() {
        depositWindowQueue.maxConcurrentOperationCount = depositClerkCount
        loanWindowQueue.maxConcurrentOperationCount = loanClerkCount
    }
    
    func stopOperation() {
        depositWindowQueue.cancelAllOperations()
        loanWindowQueue.cancelAllOperations()
    }
    
    func finishNotity() {
        depositWindowQueue.addBarrierBlock {
            self.loanWindowQueue.addBarrierBlock {
                self.bankClerk.delegate?.endTask()
            }
        }
    }
}
