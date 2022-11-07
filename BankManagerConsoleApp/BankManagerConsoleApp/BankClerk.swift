//
//  BankClerk.swift
//  Created by sunnycookie, inho
//

import Foundation

protocol BankClerk {
    var bankingType: BankingTypes { get }
    var processingTime: Double { get }
    var counter: DispatchQueue { get }
    
    func serve(customer: Customer)
    func call(customer: Customer)
}

extension BankClerk {
    func serve(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer)업무 시작")
        Thread.sleep(forTimeInterval: processingTime)
        print("\(customer.waitingNumber)번 고객 \(customer)업무 종료")
    }
    
    func call(customer: Customer) {
        counter.async {
            serve(customer: customer)
        }
    }
}

struct DepositBankClerk: BankClerk {
    let bankingType: BankingTypes
    let processingTime: Double
    let counter: DispatchQueue
}

struct LoanBankClerk: BankClerk {
    let bankingType: BankingTypes
    let processingTime: Double
    let counter: DispatchQueue
}
