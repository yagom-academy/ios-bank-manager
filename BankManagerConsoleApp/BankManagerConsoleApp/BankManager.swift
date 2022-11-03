//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank = Bank()
    
    mutating func addCustomers(count: Int) {
        for customerNumber in 1...count {
            let customer: Customer = Customer(number: customerNumber)
            bank.addCustomerToQueue(customer)
        }
    }
    
    mutating func addBankers(count: Int) {
        for _ in 1...count {
            let banker: Banker = Banker()
            bank.addBanker(banker)
        }
    }
    
    mutating func startBank() {
        bank.processBankingBusinessOfCustomers()
    }
}
