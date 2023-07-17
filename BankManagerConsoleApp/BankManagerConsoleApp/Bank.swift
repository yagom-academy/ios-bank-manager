//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by yyss99, 비모 on 2023/07/13.
//

import Foundation

struct Bank {
    private let depositBankClerk: BankClerk
    private let loanBankClerk: BankClerk
    private var customerWaitingQueue: CustomerWaitingQueue<Customer>
    private var totalCustomerCount: Int = 0
    
    init(depositBankClerkCount: Int, loanBankClerkCount: Int, customerWaitingQueue: CustomerWaitingQueue<Customer>) {
        self.depositBankClerk = BankClerk(serviceType: .deposit, numberOfBankClerk: depositBankClerkCount)
        self.loanBankClerk = BankClerk(serviceType: .loan, numberOfBankClerk: loanBankClerkCount)
        self.customerWaitingQueue = customerWaitingQueue
    }
    
    mutating func work() {
        totalCustomerCount = customerWaitingQueue.count
        let start = CFAbsoluteTimeGetCurrent()
        let group = DispatchGroup()
        
        while let customer = customerWaitingQueue.dequeue() {
            switch customer.serviceNeeded {
            case .deposit:
                depositBankClerk.work(for: customer, in: group)
            case .loan:
                loanBankClerk.work(for: customer, in: group)
            }
        }
        
        group.wait()
        let totalWorkTime = CFAbsoluteTimeGetCurrent() - start
        
        endOfWork(totalWorkTime)
    }
    
    private func endOfWork(_ totalWorkTime: CFAbsoluteTime) {
        printWorkResult(totalWorkTime)
    }
    
    private func printWorkResult(_ totalWorkTime: CFAbsoluteTime) {
        let totalWorkTime = String(format: "%.2f", totalWorkTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerCount)명이며, 총 업무시간은 \(totalWorkTime) 입니다.")
    }
}
