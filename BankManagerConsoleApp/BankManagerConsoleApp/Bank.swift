//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

import Foundation

struct Bank {
    private var customerQueue: CustomerQueue<Customer>?
    private var time: Double = 0
    private var isQueueEmpty: Bool {
        return customerQueue?.isEmpty ?? false
    }
    
    mutating func openedBank() {
        customerQueue = CustomerQueue()
    }
    
    mutating func addCustomer(customer: Customer) {
        customerQueue?.enqueue(value: customer)
    }
    
    mutating func startWork() {
        while !isQueueEmpty {
            guard let customer = customerQueue?.dequeue() else {
                return
            }

            print("\(customer.ticketNumber)번 고객 업무 시작")
            
            DispatchQueue.global().sync {
                usleep(700000)
                time += (700000 / 1000000)
                print("\(customer.ticketNumber)번 고객 업무 종료")
            }
        }   
    }
    
    mutating func resetCustomerQueue() {
        customerQueue?.clear()
        customerQueue = nil
    }
}
