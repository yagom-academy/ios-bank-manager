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
        banker.maxConcurrentOperationCount = Configuration.numberOfBanker
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
            in: Configuration.minimumCustomer...Configuration.maximumCustomer
        )
        
        for customerNumber in 1...totalCustomer {
            let customer = Customer(duration: Configuration.taskDuration,
                                    waitingNumber: customerNumber)
            
            dailyCustomerQueue.enqueue(customer)
        }
    }
    
    mutating private func customerTask(_ customer: Customer) {
        let task = BlockOperation {
            print(String(format: Namespace.startTask, customer.waitingNumber))
            print(String(format: Namespace.endTask, customer.waitingNumber))
        }
        
        banker.addOperation(task)

        dailyTotalCustomer += 1
        dailyBusinessHour += customer.duration
    }
    
    mutating private func closeBank() {
        print(String(format: Namespace.closingMessage, dailyTotalCustomer, "\(dailyBusinessHour)"))
        resetBank()
    }
    
    mutating private func resetBank() {
        dailyCustomerQueue = CustomerQueue<Customer>()
        dailyTotalCustomer = .zero
        dailyBusinessHour = .zero
    }
}

extension Bank {
    enum Configuration {
        static let numberOfBanker = 1
        static let minimumCustomer = 10
        static let maximumCustomer = 30
        static let taskDuration: Decimal = 0.7
    }
}

extension Bank {
    enum Namespace {
        static let startTask = "%d번 고객 업무 시작"
        static let endTask = "%d번 고객 업무 완료"
        static let closingMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %@초입니다."
    }
}
