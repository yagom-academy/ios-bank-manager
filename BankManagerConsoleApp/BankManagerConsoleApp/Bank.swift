//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

struct Bank {
    private var bankers: [Banker]
    private var bankQueue: CustomerQueue<Customer> = CustomerQueue()
    private var taskFinishedCustomerCount: Int = .zero
    private var totalTaskTime: Double = .zero
    
    init(bankers: [Banker]) {
        self.bankers = bankers
    }
    
    mutating private func lineUp(_ customers: inout [Customer]) {
        for number in 0..<customers.count {
            customers[number].receiveQueueNumber(queueNumber: number + 1)
            bankQueue.enqueue(customers[number])
        }
    }
    
    mutating func startBankService(_ customers: inout [Customer]) {
        lineUp(&customers)
        
        while !bankQueue.isEmpty {
            guard let currentCustomer = bankQueue.dequeue(),
                  let taskTime = bankers[0].task(currentCustomer) else {
                return
            }

            check(to: taskTime)
            finishedCustomerCount()
        }
        taskFinish()
    }
    
    mutating private func finishedCustomerCount() {
        taskFinishedCustomerCount += 1
    }
    
    mutating private func check(to taskTime: Double) {
        totalTaskTime += taskTime
    }
    
    private func taskFinish() {
        let totalTaskTime = String(format: "%.2f", totalTaskTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(taskFinishedCustomerCount)명이며, 총 업무시간은 \(totalTaskTime)초입니다.")
    }
}
