//  BankManagerConsoleApp - BankManager.swift
//  Created by Ayaan/Dragon/som on 2022/11/09.
//  Copyright © yagom academy. All rights reserved.

import Foundation

enum BankManagerState {
    case notWorking
    case working
}

struct BankManager {
    private weak var customerSettingDelegate: CustomerSettingDelegate?
    private let bank: Bank = Bank(depositBankerCount: 2, loanBankerCount: 1)
    private var state: BankManagerState = .notWorking
    
    mutating func addTenCustomers() {
        let customers: [Customer] = Customer.make()
        
        bank.setCustomerQueue(from: customers)
        
        DispatchQueue.main.async { [self] in
            customerSettingDelegate?.complete(customers)
        }
            
        if state == .notWorking {
            state = .working
            bank.startBankingService()
            state = .notWorking
        }
    }
    
    mutating func setDelegate(of delegate: CustomerSettingDelegate) {
        customerSettingDelegate = delegate
    }
    
    func reset() {
        bank.cancelWork()
        bank.removeAllCustomers()
    }
}
