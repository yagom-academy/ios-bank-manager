//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

import Foundation

struct Bank {
    enum Constant {
        static let depositTakenSeconds: Double = 0.7
    }

    private var customerQueue: CustomerQueue<Customer>?
    
    private var isQueueEmpty: Bool {
        return customerQueue?.isEmpty ?? true
    }

    init(customerQueue: CustomerQueue<Customer>? = nil) {
        self.customerQueue = customerQueue
    }

    mutating func createQueue() {
        customerQueue = CustomerQueue()
    }

    mutating func addCustomer(customer: Customer) {
        customerQueue?.enqueue(value: customer)
    }

    mutating func startWork() -> Int {
        let waitingLines = setUpWaitingLine()
        
        var userCount = 0
        
        while !isQueueEmpty {
            guard let customer = customerQueue?.dequeue() else {
                return 0
            }
            
            let customerOperation = BankerOperation(customer: customer)
            
            customerOperation.completionBlock = { userCount += 1 }
            
            switch customer.business {
            case .deposit:
                waitingLines.dispositQueue.addOperation(customerOperation)
            case .loans:
                waitingLines.loansQueue.addOperation(customerOperation)
            }
        }
        waitingLines.dispositQueue.waitUntilAllOperationsAreFinished()
        waitingLines.loansQueue.waitUntilAllOperationsAreFinished()
        
        return userCount
    }

    mutating func resetCustomerQueue() {
        customerQueue?.clear()
        customerQueue = nil
    }
}

private extension Bank {
    func setUpWaitingLine() -> (dispositQueue: OperationQueue, loansQueue: OperationQueue) {
        let depositQueue = OperationQueue()
        let loansQueue = OperationQueue()
        
        depositQueue.maxConcurrentOperationCount = 2
        loansQueue.maxConcurrentOperationCount = 1
        
        return (depositQueue, loansQueue)
    }
}
