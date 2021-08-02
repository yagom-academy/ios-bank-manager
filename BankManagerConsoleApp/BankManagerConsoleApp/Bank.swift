//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Bank {
    var customer: Customer
    let customerQueue = BankManagerQueue<Int>()
    let banker: Banker
    
    mutating func startTask() {
        while true {
            selectMode()
            if userInput() {
                initCustomerQueue()
                while !customerQueue.isEmpty {
                    banker.doBusiness(customerQueue: customerQueue)
                }
                print(BankMessage.bankClosed(customers: customer.number))
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
    
    func selectMode() {
        print(BankMessage.showSelectMessage, terminator: " ")
    }
    
    func userInput() -> Bool {
        if let input = readLine(), let intInput = Int(input), intInput == Int.one {
            return true
        }
        return false
    }
}
