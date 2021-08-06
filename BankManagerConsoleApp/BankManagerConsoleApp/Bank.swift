//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/07/30.
//

import Foundation

struct Bank {
    private let userInteraction = UserInteraction()
    private let customerQueue = BankManagerQueue<Customer>()
    private var customers = Int.zero
    private var bankers = [Banker]()
    
    
    mutating func addBanker(howMany: Int, type: BusinessType) {
        guard howMany != 0 else {
            return
        }
        
        for _ in 1...howMany {
            bankers.append(Banker(type: type))
        }
    }
    
    mutating func startTask() {
        while true {
            userInteraction.selectMode()
            guard userInteraction.isBankOpen() else { return }
            generateTodayCustomers()
            insertCustomerQueue(of: customers)
            addBanker(howMany: 2, type: .deposit)
            addBanker(howMany: 1, type: .loan)
            
            while let customer = customerQueue.dequeue() {
                
                var banker = bankers.removeFirst()
                
                while banker.type != customer.business {
                    bankers.append(banker)
                    banker = bankers.removeFirst()
                }
                
                banker.doBusiness(customer: customer)
                bankers.append(banker)
                
            }
        }
    }
    
    private func isDepositType(of customer: Customer) -> Bool {
        return customer.business == .deposit
    }
    
    private func insertCustomerQueue(of totalCustomers: Int) {
        for sequence in CustomerNumber.firstCustomer...totalCustomers {
            guard let randomCusotomerBusinessType = BusinessType.allCases.randomElement() else { return }
            let currentCustomer = Customer(numberTicket: sequence, business: randomCusotomerBusinessType)
            customerQueue.enqueue(data: currentCustomer)
        }
    }
    
    private mutating func generateTodayCustomers() {
        customers = Int.random(in: CustomerNumber.minimumCustomer..<CustomerNumber.maximumCustomer)
    }
}
