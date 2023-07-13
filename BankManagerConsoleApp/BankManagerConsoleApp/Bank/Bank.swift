//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by karen on 2023/07/14.
//

import Foundation

struct Bank {
    private var teller: Teller = Teller()
    private var watingCustomer: Queue<Customer> = Queue<Customer>()
    private var totalProcessingTime = ""
    private var customerCount = UInt.zero
    
    mutating func open() {
        lineUpCustomer()
        totalProcessingTime = timeCheck {
            dailyWork()
        }
        close()
    }
    
    private mutating func lineUpCustomer() {
        let customerCount = UInt.random(in: 10...30)
        for number in 1...customerCount {
            let customer = Customer(number: UInt(number))
            watingCustomer.enqueue(customer)
        }
    }
    
    private mutating func dailyWork(){
        while !watingCustomer.isEmpty {
            guard let customer = watingCustomer.dequeue() else { return }
            
            teller.processCustomer(customer)
            customerCount += 1
        }
    }
    
    private func timeCheck(_ block: () -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        block()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        let time = String(format: "%.2f", durationTime)
        return time
    }
    
    private mutating func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalProcessingTime)초입니다.")
        reset()
    }
    
    private mutating func reset() {
        watingCustomer = Queue<Customer>()
        customerCount = .zero
    }
}
