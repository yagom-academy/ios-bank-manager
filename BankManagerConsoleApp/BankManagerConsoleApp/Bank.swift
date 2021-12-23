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
    var numberOfCustomerRange: ClosedRange<Int> {
        return 1...numberOfCustomer
    }
    
    init(numberOfCustomerRange: ClosedRange<Int> = 10...30, taskTime: Double = 0.7) {
        self.customerQueue = CustomerQueue()
        self.numberOfCustomer = Int.random(in: numberOfCustomerRange)
        self.taskTime = taskTime
    }
    
    func enqueueCustomer() {
        for count in numberOfCustomerRange {
            let customer = Customer(turn: count)
            customerQueue.enqueue(data: customer)
        }
    }
}
