//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Bank {
    let userInteraction = UserInteraction()
    let customerQueue = BankManagerQueue<Int>()
    let banker: Banker
    var customers = Int.zero
    
    mutating func startTask() {
        while true {
            userInteraction.selectMode()
            if userInteraction.userInput() {
                generateTodayCustomers()
                insertCustomerQueue(of: customers)
                while !customerQueue.isEmpty {
                    banker.doBusiness(customerQueue: customerQueue)
                }
                userInteraction.settlementResult(customers: customers)
            } else {
                return
            }
        }
    }
    
    func insertCustomerQueue(of customers: Int) {
        for customer in Int.one...customers {
            customerQueue.enqueue(data: customer)
        }
    }
    
    mutating func generateTodayCustomers() {
        customers = Int.random(in: Int.ten..<Int.thirty)
    }
}
