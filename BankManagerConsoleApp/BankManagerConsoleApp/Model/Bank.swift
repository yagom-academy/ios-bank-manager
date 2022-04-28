//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/28.

struct Bank {
    var customerQueue = Queue<Customer>()
    
    mutating func receiveCustomer() {
        for number in 1...Int.random(in: 10...30) {
            customerQueue.enqueue(newElement: Customer(number: number))
        }
    }
}
