//
//  BankManager.swift
//  Created by brody, christy, harry.
//  Copyright © yagom academy. All rights reserved.
//

class BankManager {
    var bank = Bank()
    
    func addTenCustomers(_ customers: [Customer]) {
        bank.setUpCustomerQueue(customers: customers)
    }
    
    func startBusiness() {
        bank.startBankService()
    }
}
