//  BankManagerConsoleApp - BankManager.swift
//  Created by Ayaan/Dragon/som on 2022/11/09.
//  Copyright © yagom academy. All rights reserved.

import Foundation

enum BankerState {
    case notWorking
    case working
}

class BankManager {
    weak var customerSettingDelegate: CustomerSettingDelegate?
    private let bank: Bank = Bank(depositBankerCount: 2, loanBankerCount: 1)
    private var depositBankerState: BankerState = .notWorking
    private var loanBankerState: BankerState = .notWorking
    private let bankWorkingGroup: DispatchGroup = DispatchGroup()
    
    func addTenCustomers() {
        let customers: [Customer] = Customer.make()
        
        bank.setCustomerQueue(from: customers)
        
        DispatchQueue.main.async { [self] in
            customerSettingDelegate?.complete(customers)
        }
    }
    
    func startWork() {
        DispatchQueue.global().async(group: bankWorkingGroup) { [self] in
            startDepositService()
        }
        DispatchQueue.global().async(group: bankWorkingGroup) { [self] in
            startLoanService()
        }
        
        bankWorkingGroup.notify(queue: .main) {
            NotificationCenter.default.post(name: .completeBankingSevice,
                                            object: nil)
        }
    }
    
    func startDepositService() {
        if depositBankerState == .notWorking {
            depositBankerState = .working
            bank.startBankingService(of: .deposit) { [self] in
                depositBankerState = .notWorking
            }
        }
    }
    
    func startLoanService() {
        if loanBankerState == .notWorking {
            loanBankerState = .working
            bank.startBankingService(of: .loan) { [self] in
                loanBankerState = .notWorking
            }
        }
    }
    
    func reset() {
        bank.removeAllCustomers()
        Customer.reset()
        depositBankerState = .notWorking
        loanBankerState = .notWorking
    }
}
