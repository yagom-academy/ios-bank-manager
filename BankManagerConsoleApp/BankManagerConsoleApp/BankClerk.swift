//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct BankClerk {
}

//MARK:- Handle Task Method
extension BankClerk {
    func work(for customer: Customer, during time: Double) {
        guard let customerBusiness = customer.business else {
            return
        }
        
        print("\(customer.ticketNumber)번 고객 \(customerBusiness)업무 시작")
        Thread.sleep(forTimeInterval: time)
        print("\(customer.ticketNumber)번 고객 \(customerBusiness)업무 완료")
    }
}
