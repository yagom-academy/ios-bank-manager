//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/12.
//

import Foundation

struct BankTeller {
    let processingTime: Double = 0.7
    
    func doWork(for customer: Customer) {
        print("\(customer.numberTicket)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: processingTime)
        print("\(customer.numberTicket)번 고객 업무 완료")
    }
}
