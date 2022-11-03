//
//  Bank.swift
//  BankManagerConsoleApp

import Darwin

struct Bank {
    private let numberOfClerks: Int
    private var waitingLine: Queue<Customer>
    private(set) var customerCount: Int = 0
    
    mutating func performTask() {
        guard let customer = waitingLine.dequeue() else {
            return
        }
        
        print("\(customer.queueNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customer.queueNumber)번 고객 업무 완료")
        customerCount += 1
    }
}
