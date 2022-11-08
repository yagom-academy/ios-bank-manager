//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, tottale on 11/3/22.
//
import Foundation

struct Bank {
    let clerks: [BankClerk]
    let customerQueue = Queue<Customer>()
    var customerCount: Int = 0
    
    init(clerkCount: Int) {
        self.clerks = Array(repeating: BankClerk(), count: clerkCount)
    }
    
    func open() {
        startBankJob()
    }
    
    func startBankJob() {
        let startTime = CFAbsoluteTimeGetCurrent()
        manageCustomer()
        let endTime = CFAbsoluteTimeGetCurrent()
        let timeInterval = endTime - startTime
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(timeInterval.formattedNumber)초입니다.")
    }
    
    func manageCustomer() {
        while let customer = customerQueue.dequeue() {
            clerks.first?.work(for: customer)
        }
    }
    
    func close() {}
    
}
