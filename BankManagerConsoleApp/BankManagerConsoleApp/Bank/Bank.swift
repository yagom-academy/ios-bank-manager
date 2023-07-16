//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/14.
//

struct Bank {
    private let bankClerk = BankClerk()
    private var customers = Queue<Customer>()

    init() {
        let randomRange = 1...Int.random(in: 10...30)
        randomRange.forEach { priority in
            customers.enqueue(Customer(priority: priority))
        }
    }
    
    mutating func start() {
        var totalTaskTime = 0.0
        var totalCustomerCount = 0
        
        while let customer = customers.dequeue() {
            totalTaskTime += bankClerk.work(customer: customer)
            totalCustomerCount += 1
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무시간은 \(String(format: "%.2f", totalTaskTime))초 입니다.")
    }
}
