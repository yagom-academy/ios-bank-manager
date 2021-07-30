//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Bank {
    let customer: Customer
    let customerQueue = BankManagerQueue<Int>()
    let banker: Banker
    
    func initCustomerQueue() {
        for customer in Int.one...customer.numbers {
            customerQueue.enqueue(data: customer)
        }
    }
    
}
