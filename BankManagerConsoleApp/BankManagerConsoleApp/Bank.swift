//
//  Bank.swift
//  BankManagerConsoleApp

import Darwin

struct Bank {
    private let numberOfClerks: Int
    private var waitingLine: Queue<Customer> = Queue()
    private(set) var customerCount: Int = 0
    
    init(numberOfClerks: Int) {
        self.numberOfClerks = numberOfClerks
    }
    
    mutating func performTask() {
        guard let customer = waitingLine.dequeue() else {
            return
        }
        
        print("\(customer.queueNumber)번 고객 업무 시작")
        
        usleep(700000)
        
        print("\(customer.queueNumber)번 고객 업무 완료")
        customerCount += 1
    }
    
    mutating func addCustomer(_ customer: Customer) {
        waitingLine.enqueue(customer)
    }
}
