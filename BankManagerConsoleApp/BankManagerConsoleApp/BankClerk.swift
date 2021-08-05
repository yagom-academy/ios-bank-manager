//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct BankClerk {
}

extension BankClerk {
    func work(for customer: Customer, during time: Double) {
        print("\(customer.ticketNumber)번 고객 \(customer.business)업무 시작")
        Thread.sleep(forTimeInterval: time)
        print("\(customer.ticketNumber)번 고객 \(customer.business)업무 완료")
    }
}
