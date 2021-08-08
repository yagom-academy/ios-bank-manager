//
//  OrdinaryBankTeller.swift
//  BankManagerConsoleApp
//
//  Created by 홍정아 on 2021/07/30.
//

import Foundation

struct OrdinaryBankTeller: BankTeller {
    let duty: BankingCategory = .unspecified
    
    func serve(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: customer.desiredTask.timeRequired)
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
