//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, tottale on 11/3/22.
//
import Foundation

struct Bank {
    let clerk = BankClerk()
    let customerQueue = Queue<Customer>()
    
    func open() {
        startBankJob()
    }
    
    func startBankJob() {
        let startTime = CFAbsoluteTimeGetCurrent()
        let customerCount = manageCustomer()
        let endTime = CFAbsoluteTimeGetCurrent()
        let timeInterval = endTime - startTime
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(timeInterval.formattedNumber)초입니다.")
    }
    
    func manageCustomer() -> Int {
        var customerCount = 0
        while let customer = customerQueue.dequeue() {
            clerk.work(for: customer)
            
            customerCount += 1
        }
        
        return customerCount
    }
    
    func close() {}
    
}
