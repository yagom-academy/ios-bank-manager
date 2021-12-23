//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/23.
//

import Foundation

class BankClerk {
    var bank: Bank?
    
    func work() {
        var customerCount: Int = 0
        var totalProcessingTime: Double = 0
        
        while let customer = bank?.customerQueue.dequeue() {
            printProcess(of: customer)
            customerCount += 1
            totalProcessingTime += customer.processingTime
        }
        
        bank?.close(totalCustomers: customerCount, totalProcessingTime: totalProcessingTime)
    }
    
    func printProcess(of customer: Customer) {
        print("\(customer.turn)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: TimeInterval(customer.processingTime))
        print("\(customer.turn)번 고객 업무 완료")
    }
}
    
