//
//  BankManager.swift
//  Created by brody, christy, harry.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    var bank = Bank()
    var customerQueueManageDelegate: CustomerQueueDelegate?
    
    func addTenCustomers(_ customers: [Customer]) {
        bank.setUpCustomerQueue(customers: customers)
    }
}
