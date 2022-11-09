//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, ttotale on 2022/11/03.
//
import Foundation

struct BankClerk {
    func work(for customer: Customer) {
        print("\(customer.number)번 고객 \(customer.serviceType.message)업무 시작")
        usleep(useconds_t(700000))
        print("\(customer.number)번 고객 \(customer.serviceType.message)업무 완료")
    }
}
