//
//  BankOperationProcessing.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import Foundation

protocol BankOperationProcessing {
    var customer: Customer { get }
    
    func work(customer: Customer)
}

extension BankOperationProcessing {
    func work(customer: Customer) {
        print("\(customer.ticketNumber)번 고객 \(customer.business.rawValue)업무 시작")
        Thread.sleep(forTimeInterval: customer.business.businessTime)
        print("\(customer.ticketNumber)번 고객 \(customer.business.rawValue)업무 종료")
    }
}
