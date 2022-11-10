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
        let bankers: [Banker] = Array.init(repeating: Banker(), count: count)
        bank.addBanker(bankers)
    }
    
    mutating func startBank() {
        bank.startBankBusiness()
    }
    
    mutating func reset() {
        bank = Bank()
    }
}
