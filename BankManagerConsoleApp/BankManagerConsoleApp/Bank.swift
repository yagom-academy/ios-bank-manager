//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Seul Mac on 2021/12/23.
//

import Foundation

struct Bank {
    
    let customerQueue: CustomerQueue<Customer>
    let numberOfCustomer: Int
    let taskTime: Double
    
    init(numberOfCustomerRange: ClosedRange<Int> = 10...30, taskTime: Double = 0.7) {
        self.customerQueue = CustomerQueue()
        self.numberOfCustomer = Int.random(in: numberOfCustomerRange)
        self.taskTime = taskTime
    }
}
