//
//  BankManager.swift
//  Created by Kiwi, Kay.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class Banker {
    private let depositSemaphore = DispatchSemaphore(value: 2)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    
    func handleDepositCustomers(customer: Customer, group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            self.depositSemaphore.wait()
            print("\(customer.customerNumber)번 고객 \(customer.business.name)업무 시작")
            Thread.sleep(forTimeInterval: customer.business.processingTime)
            print("\(customer.customerNumber)번 고객 \(customer.business.name)업무 완료")
            self.depositSemaphore.signal()
        }
    }
    
    func handleLoanCustomers(customer: Customer, group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            self.loanSemaphore.wait()
            print("\(customer.customerNumber)번 고객 \(customer.business.name)업무 시작")
            Thread.sleep(forTimeInterval: customer.business.processingTime)
            print("\(customer.customerNumber)번 고객 \(customer.business.name)업무 완료")
            self.loanSemaphore.signal()
        }
    }
}

