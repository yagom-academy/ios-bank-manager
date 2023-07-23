//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by hoon, minsup on 2023/07/14.
//

struct Customer {
    let numberTicket: Int
    let task: Bank.Task
    
    init(numberTicket: Int) {
        self.numberTicket = numberTicket
        self.task = Bank.Task.random
    }
}
