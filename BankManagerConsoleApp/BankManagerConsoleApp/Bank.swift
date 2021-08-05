//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Bank {
    private let userInteraction = UserInteraction()
    private let depositCustomerQueue = BankManagerQueue<Customer>()
    private let loanCustomerQueue = BankManagerQueue<Customer>()
    private let banker = Banker()
    private var customers = Int.zero
    
    mutating func startTask() {
        while true {
            userInteraction.selectMode()
            guard userInteraction.isBankOpen() else { return }
            generateTodayCustomers()
            insertCustomerQueue(of: customers)
            while !depositCustomerQueue.isEmpty {
                
            }
            userInteraction.showSettlementResult(customers: customers)
        }
    }
    
    private func isDepositType(of customer: Customer) -> Bool {
        return customer.business == .deposit
    }
    
    private func insertCustomerQueue(of totalCustomers: Int) {
        for sequence in CustomerNumber.firstCustomer...totalCustomers {
            guard let randomCusotomerBusinessType = BusinessType.allCases.randomElement() else { return }
            let currentCustomer = Customer(numberTicket: sequence, business: randomCusotomerBusinessType)
            
            if isDepositType(of: currentCustomer) {
                depositCustomerQueue.enqueue(data: currentCustomer)
            } else {
                loanCustomerQueue.enqueue(data: currentCustomer)
            }
        }
    }
    
    private mutating func generateTodayCustomers() {
        customers = Int.random(in: CustomerNumber.minimumCustomer..<CustomerNumber.maximumCustomer)
    }
}
