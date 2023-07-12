//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Min Hyun on 2023/07/12.
//

import Foundation

struct Bank {
    private var banker = OperationQueue()
    private var dailyCustomerQueue = CustomerQueue<Customer>()
    private var dailyTotalCustomer: Int = .zero
    private var dailyBusinessHour: Decimal = .zero
    
    init() {
        banker.maxConcurrentOperationCount = 1
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
        let totalCustomer = Int.random(in: 10...30)
        
        for customerNumber in 1...totalCustomer {
            let customer = Customer(duration: 0.7, waitingNumber: customerNumber)
            dailyCustomerQueue.enqueue(customer)
        }
    }
    
    mutating private func customerTask(_ customer: Customer) {
        let task = BlockOperation {
            print("\(customer.waitingNumber)번 고객 업무 시작")
            print("\(customer.waitingNumber)번 고객 업무 출력")
        }
        banker.addOperation(task)

        dailyTotalCustomer += 1
        dailyBusinessHour += customer.duration
    }
    
    mutating private func closeBank() {
        let closingMessage = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(dailyTotalCustomer)명이며, 총 업무시간은 \(dailyBusinessHour)초입니다."
        
        print(closingMessage)
        resetBank()
    }
    
    mutating private func resetBank() {
        dailyCustomerQueue = CustomerQueue<Customer>()
        dailyTotalCustomer = .zero
        dailyBusinessHour = .zero
    }
}
