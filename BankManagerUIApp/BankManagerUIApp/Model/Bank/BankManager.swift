//
//  BankManager.swift
//  Created by brody, christy, harry.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank = Bank()
    
    func addTenCustomers(_ customers: [Customer]) {
        bank.setUpCustomerQueue(customers: customers)
    }
    
    mutating func startBusiness() {
        bank.startBankService()
    }
    
    func stopAllTask() {
        bank.reset()
    }
    
    func startTimer(handler: @escaping ()->()) {
        bank.timer.start(handler: handler)
    }
    
    func endTimer() {
        bank.timer.cancel()
    }
}
