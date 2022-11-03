//
//  Bank.swift
//  Bank
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

struct Bank {
    private var customerQueue: CustomerQueue<Customer> = CustomerQueue<Customer>()
    
    mutating func addCustomer(customer: Customer) {
        customerQueue.enqueue(value: customer)
    }
}
