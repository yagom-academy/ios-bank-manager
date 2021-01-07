//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

struct Bank {
    var customers: [Customer] = []
    private var bankManagers: [BankManager] = []
    var numberOfCustomer: Int {
        return customers.count
    }
    private var openTime: Date?
    private var closeTime: Date?
    private var totalTime: Double? {
        guard let openTime = openTime, let closeTime = closeTime else {
            return nil
        }
        let calculatedTime = Double(closeTime.timeIntervalSince(openTime))
        return calculatedTime
    }
    
    init(bankManagerNumber: Int) {
        self.initializeBankManagers(bankManagerNumber: bankManagerNumber)
    }
    
    mutating private func initializeBankManagers(bankManagerNumber: Int) {
        for number in 1...bankManagerNumber {
            bankManagers.append(BankManager(number: number))
        }
    }
    
    mutating private func assignCustomerToTeller() {
        var bankTeller = bankManagers[0]
        self.openTime = Date()
        while(customers.count > 0) {
            if bankTeller.state == .notWorking {
                let customer = customers.removeFirst()
                bankTeller.performTask(customerNumber: customer.waitNumber)
            }
        }
        self.closeTime = Date()
    }
}

