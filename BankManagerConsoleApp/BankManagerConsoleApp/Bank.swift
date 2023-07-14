//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

import Foundation

struct Bank {
    var bankers: [Banker]
    var bankQueue: CustomerQueue<Customer> = CustomerQueue()
    var taskFinishedCustomerCount: Int = .zero // 변수명 좀 더 고민
    var totalTaskTime: Double = .zero
    
    mutating func lineUp(_ customers: inout [Customer]) {
        for index in 0..<customers.count {
            customers[index].queueNumber = index + 1
            bankQueue.enqueue(customers[index])
        }
    }
    
    mutating func startBankService() {
        while !bankQueue.isEmpty {
            guard let currentCustomer = bankQueue.dequeue() else {
                return
            }
            
            for banker in 0..<bankers.count {
                guard let taskTime = bankers[banker].task(currentCustomer) else {
                    return
                }
                check(to: taskTime)
            }
            finishedCustomerCount()
        }
        taskFinish()
    }
    
    mutating func finishedCustomerCount() {
        taskFinishedCustomerCount += 1
    }
    
    mutating func check(to taskTime: Double) {
        totalTaskTime += taskTime
    }
    
    func taskFinish() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(taskFinishedCustomerCount)명이며, 총 업무시간은 \(totalTaskTime)초입니다.")
    }
}
