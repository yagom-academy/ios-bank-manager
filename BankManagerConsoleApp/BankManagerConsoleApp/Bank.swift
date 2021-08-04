//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Bank {
    private let userInteraction = UserInteraction()
    private let customerQueue = BankManagerQueue<Int>()
    private let banker = Banker()
    private var customers = Int.zero
    
    mutating func startTask() {
        while true {
            userInteraction.selectMode()
            guard userInteraction.userInput() else { return }
            generateTodayCustomers()
            insertCustomerQueue(of: customers)
            while !customerQueue.isEmpty {
                banker.doBusiness(customerQueue: customerQueue)
            }
            userInteraction.settlementResult(customers: customers)
        }
    }
    
    private func insertCustomerQueue(of customers: Int) {
        for customer in Int.one...customers {
            customerQueue.enqueue(data: customer)
        }
    }
    
    private mutating func generateTodayCustomers() {
        customers = Int.random(in: Int.ten..<Int.thirty)
    }
}
