//
//  Bank.swift
//  BankManagerConsoleApp

import Darwin

struct Bank {
    private let numberOfClerks: Int
    private var waitingLine: Queue<Customer> = Queue()
    private(set) var finishedCustomerCount: Int = 0
    private let timePerTask: UInt32 = 700000
    
    init(numberOfClerks: Int) {
        self.numberOfClerks = numberOfClerks
    }
    
    mutating func performTask() {
        guard let customer = waitingLine.dequeue() else {
            return
        }
        
        print("\(customer.waitingNumber)번 고객 업무 시작")
        
        usleep(timePerTask)
        
        print("\(customer.waitingNumber)번 고객 업무 완료")
        finishedCustomerCount += 1
    }
    
    mutating func addCustomer(_ customer: Customer) {
        waitingLine.enqueue(customer)
    }
}
