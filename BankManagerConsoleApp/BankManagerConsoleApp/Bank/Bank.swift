//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by karen on 2023/07/14.
//

import Foundation

struct Bank {
    private let teller: UInt = 1
    private var customersQueue: Queue<Customer> = Queue<Customer>()
    private let processingTime: TimeInterval = 0.7
    private var totalProcessingTime = ""
    private var customerCount = UInt.zero
    var state: State = .working
    
    mutating func open() {
        lineUpCustomer()
        totalProcessingTime = timeCheck {
            dailyWork()
        }
        finish()
    }
    
    private mutating func lineUpCustomer() {
        let customerCount = UInt.random(in: 10...30)
        let customers = (1...customerCount)
        customers.map(Customer.init).forEach { customersQueue.enqueue($0) }
    }
    
    private mutating func dailyWork() {
        while !customersQueue.isEmpty {
            guard let customer = customersQueue.dequeue() else { return }
            
            process(customer: customer)
            customerCount += 1
        }
    }
    
    private mutating func process(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: processingTime)
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
    
    private func timeCheck(_ block: () -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        block()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        let time = String(format: "%.2f", durationTime)
        return time
    }
    
    private mutating func finish() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalProcessingTime)초입니다.")
        reset()
    }
    
    mutating func close() {
        state = .notWorking
    }
    
    private mutating func reset() {
        customersQueue.clear()
        customerCount = .zero
    }
}

extension Bank {
    enum State {
        case working
        case notWorking
    }
}
