//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/12.
//

import Foundation

struct Bank {
    private var banker = OperationQueue()
    private var dailyCustomerQueue = CustomerQueue<Customer>()
    private var dailyTotalCustomer: Int = .zero
    private var dailyBusinessHour: Decimal = .zero
    
    init() {
        banker.maxConcurrentOperationCount = BankConfiguration.numberOfBanker
    }
    
    mutating func dailyWork() {
        setDailyCustomerQueue()
        
        while let customer = dailyCustomerQueue.dequeue() {
            customerTask(customer)
        }
        
        banker.waitUntilAllOperationsAreFinished()
        closeBank()
    }
    
    mutating private func setDailyCustomerQueue() {
        let totalCustomer = Int.random(
            in: BankConfiguration.minimumCustomer...BankConfiguration.maximumCustomer
        )
        
        for customerNumber in 1...totalCustomer {
            let customer = Customer(duration: CustomerConfiguration.duration,
                                    waitingNumber: customerNumber)
            
            dailyCustomerQueue.enqueue(customer)
        }
    }
    
    mutating private func customerTask(_ customer: Customer) {
        let task = BlockOperation {
            print(String(format: BankNamespace.startTask, customer.waitingNumber))
            print(String(format: BankNamespace.endTask, customer.waitingNumber))
        }
        
        banker.addOperation(task)

        dailyTotalCustomer += 1
        dailyBusinessHour += customer.duration
    }
    
    mutating private func closeBank() {
        print(String(format: BankNamespace.closingMessage, dailyTotalCustomer, "\(dailyBusinessHour)"))
        resetBank()
    }
    
    mutating private func resetBank() {
        dailyCustomerQueue = CustomerQueue<Customer>()
        dailyTotalCustomer = .zero
        dailyBusinessHour = .zero
    }
}
