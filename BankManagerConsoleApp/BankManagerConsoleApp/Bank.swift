//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Bank {
    let userInteraction = UserInteraction()
    var customer: Customer
    let customerQueue = BankManagerQueue<Int>()
    let banker: Banker
    
    mutating func startTask() {
        while true {
            userInteraction.selectMode()
            if userInteraction.userInput() {
                initCustomerQueue()
                while !customerQueue.isEmpty {
                    banker.doBusiness(customerQueue: customerQueue)
                }
                userInteraction.settlementResult(customers: customer.number)
            } else {
                return
            }
        }
    }
    
    mutating func initCustomerQueue() {
        customer.makeRandomNumber()
        for customer in Int.one...customer.number {
            customerQueue.enqueue(data: customer)
        }
    }
}
