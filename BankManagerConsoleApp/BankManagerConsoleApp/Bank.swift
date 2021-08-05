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
            guard userInteraction.isBankOpen() else { return }
            generateTodayCustomers()
            insertCustomerQueue(of: customers)
            while !customerQueue.isEmpty {
                banker.doBusiness(customerQueue: customerQueue)
            }
            userInteraction.showSettlementResult(customers: customers)
        }
    }
    
    
    private func insertCustomerQueue(of totalCustomers: Int) {
        for customer in CustomerNumber.firstCustomer...totalCustomers {
            customerQueue.enqueue(data: customer)
        }
    }
    
    private mutating func generateTodayCustomers() {
        customers = Int.random(in: CustomerNumber.minimumCustomer..<CustomerNumber.maximumCustomer)
    }
}
