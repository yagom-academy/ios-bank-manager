//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

struct Bank {
    private let bankers: [Banker]
    private var bankQueue: CustomerQueue<Customer> = CustomerQueue()
    private var finishedCustomerCount: Int = .zero
    private var totalWorkTime: Double = .zero
    
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
            guard let currentCustomer = bankQueue.dequeue() else {
                return
            }
            
            bankers.first?.work(of: currentCustomer)
            
            guard let workTime = bankers.first?.notifyWorkTime() else {
                return
            }

            check(to: workTime)
            countFinishedCustomer()
        }
        workFinish()
    }
    
    mutating private func countFinishedCustomer() {
        finishedCustomerCount += 1
    }
    
    mutating private func check(to workTime: Double) {
        totalWorkTime += workTime
    }
    
    private func workFinish() {
        let totalWorkTime = String(format: "%.2f", totalWorkTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(finishedCustomerCount)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
