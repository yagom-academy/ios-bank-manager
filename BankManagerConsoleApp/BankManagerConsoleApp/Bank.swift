//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

import Foundation

struct Bank {
    var bankers: [Banker]
    var bankQueue: CustomerQueue<Customer> = CustomerQueue()
    
    mutating func lineUp(_ customers: inout [Customer]) {
        for index in 0..<customers.count {
            customers[index].queueNumber = index + 1
            bankQueue.enqueue(customers[index])
        }
    }
    
    mutating func bankService() {
        while !bankQueue.isEmpty {
            guard let currentCustomer = bankQueue.dequeue() else {
                return
            }
            
            for banker in 0..<bankers.count {
                bankers[banker].task(currentCustomer)
            }
        }
    }
}
