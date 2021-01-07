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
    
    init(bankManagerNumber: Int) {
        self.initializeBankManagers(bankManagerNumber: bankManagerNumber)
    }
    
    mutating private func initializeBankManagers(bankManagerNumber: Int) {
        for number in 1...bankManagerNumber {
            bankManagers.append(BankManager(number: number))
        }
    }
}

