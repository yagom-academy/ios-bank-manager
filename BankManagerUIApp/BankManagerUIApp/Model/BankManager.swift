//  BankManagerConsoleApp - BankManager.swift
//  Created by Ayaan/Dragon/som on 2022/11/09.
//  Copyright © yagom academy. All rights reserved.

import Foundation

enum BankerState {
    case notWorking
    case working
}

class BankManager {
    private weak var customerSettingDelegate: CustomerSettingDelegate?
    private let bank: Bank = Bank(depositBankerCount: 2, loanBankerCount: 1)
    private var depositBankerState: BankerState = .notWorking
    private var loanBankerState: BankerState = .notWorking
    
    func addTenCustomers() {
        let customers: [Customer] = Customer.make()
        
        bank.setCustomerQueue(from: customers)
        
        DispatchQueue.main.async { [self] in
            customerSettingDelegate?.complete(customers)
        }
        
        DispatchQueue.global().async { [self] in
            startDepositService()
        }
        DispatchQueue.global().async { [self] in
            startLoanService()
        }
    }
    
    func startDepositService() {
        if depositBankerState == .notWorking {
            depositBankerState = .working
            bank.startBankingService(of: .deposit) { [self] in
                depositBankerState = .notWorking
                if isCompletedBankingService() == true {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: .completeBankingSevice,
                                                        object: nil)
                    }
                }
            }
        }
    }
    
    func startLoanService() {
        if loanBankerState == .notWorking {
            loanBankerState = .working
            bank.startBankingService(of: .loan) { [self] in
                loanBankerState = .notWorking
                if isCompletedBankingService() == true {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: .completeBankingSevice,
                                                        object: nil)
                    }
                }
            }
        }
    }
    
    func isCompletedBankingService() -> Bool {
        switch (depositBankerState, loanBankerState) {
        case (.notWorking, .notWorking):
            return true
        default:
            return false
        }
    }
    
    func setDelegate(of delegate: CustomerSettingDelegate) {
        customerSettingDelegate = delegate
    }
    
    func reset() {
        bank.removeAllCustomers()
        Customer.reset()
        depositBankerState = .notWorking
        loanBankerState = .notWorking
    }
}
