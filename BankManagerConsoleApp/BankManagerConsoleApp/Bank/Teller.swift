//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by karen on 2023/07/14.
//

import Foundation

struct Teller {
    private let processingTime: TimeInterval = 0.7
    
    mutating func processCustomer(_ customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: processingTime)
        print("\(customer.number)번 고객 업무 완료")
    }
}
