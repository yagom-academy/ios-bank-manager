//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

import Foundation

struct Bank {
    private var customerQueue: CustomerQueue<Customer> = CustomerQueue<Customer>()
    private var time: Double = 0
    
    mutating func addCustomer(customer: Customer) {
        customerQueue.enqueue(value: customer)
    }
    
    mutating func startWork() {
        while !customerQueue.isEmpty {
            guard let customer = customerQueue.dequeue() else {
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
}
