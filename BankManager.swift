//
//  BankManager.swift
//  Created by sunnycookie, inho
//

import Foundation

struct BankManager {
    var customers: Queue<Customer> = Queue()
    
    mutating func receiveCustomer() {
        let customerCount = Int.random(in: 10...30)
        for count in 1...customerCount {
            customers.enqueue(Customer.init(waitingNumber: count))
        }
    }
}
