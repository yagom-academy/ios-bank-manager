//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    var depositTimer: Double = 0
    var loanTimer: Double = 0
    var processedCustomer: Int = 0
    
    func task(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer.purposeOfServie.rawValue)업무 시작")
        
        switch customer.purposeOfServie {
        case .deposit:
            usleep(700000)
        case .loan:
            usleep(1100000)
        }
        print("\(customer.waitingNumber)번 고객 \(customer.purposeOfServie.rawValue)업무 종료")
    }
    
    func addDepositTime () {
        depositTimer += 0.7
    }
    
    func addLoanTime() {
        loanTimer += 1.1
    }
    
    func addCustomer() {
        processedCustomer += 1
    }
    
    func managerClear() {
        depositTimer = 0
        loanTimer = 0
        processedCustomer = 0 
    }
}
