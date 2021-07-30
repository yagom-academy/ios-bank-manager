//
//  OrdinaryBankTeller.swift
//  BankManagerConsoleApp
//
//  Created by 홍정아 on 2021/07/30.
//

import Foundation

class OrdinaryBankTeller: BankTeller {
    let duty: BankingTask = .unspecified
    
    func serve(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: customer.desiredTask.timeRequired)
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
