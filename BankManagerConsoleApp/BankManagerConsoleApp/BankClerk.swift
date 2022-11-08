//
//  BankClerk.swift
//  Created by sunnycookie, inho
//

import Foundation

protocol BankClerk {
    var bankingType: BankingType { get }
    var processingTime: Double { get }
    var counter: DispatchQueue { get }
    
    func serve(customer: Customer, group: DispatchGroup)
}

extension BankClerk {
    func serve(customer: Customer, group: DispatchGroup) {
        counter.async(group: group) {
            print("\(customer.waitingNumber)번 고객 \(customer.bankingType)업무 시작")
            Thread.sleep(forTimeInterval: processingTime)
            print("\(customer.waitingNumber)번 고객 \(customer.bankingType)업무 종료")
        }
    }
}


struct DepositBankClerk: BankClerk {
    let bankingType: BankingType
    let processingTime: Double
    let counter: DispatchQueue
}

struct LoanBankClerk: BankClerk {
    let bankingType: BankingType
    let processingTime: Double
    let counter: DispatchQueue
}
