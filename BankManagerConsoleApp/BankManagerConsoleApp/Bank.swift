//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by yyss99, 비모 on 2023/07/13.
//

struct Bank {
    private let bankClerk: BankClerk
    private var customerWaitingQueue: CustomerWaitingQueue<Customer>
    private var totalCustomerCount: Int = 0
    
    init(bankClerk: BankClerk, customerWaitingQueue: CustomerWaitingQueue<Customer>) {
        self.bankClerk = bankClerk
        self.customerWaitingQueue = customerWaitingQueue
    }
    
    mutating func work() {
        totalCustomerCount = customerWaitingQueue.count
        
        while !customerWaitingQueue.isEmpty {
            guard let customer = customerWaitingQueue.dequeue() else { continue }
            bankClerk.work(customerNumber: customer.number)
        }
        
        endOfWork()
    }
    
    private func endOfWork() {
        printWorkResult()
    }
    
    private func printWorkResult() {
        let workTime = BankClerk.workTime * Double(totalCustomerCount)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무시간은 \(workTime)초입니다.")
    }
}
