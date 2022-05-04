//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/29.
//
import Foundation

struct BankClerk {
    static func startDepositWork(customer: Customer) {
        print("\(customer.number) 번 고객 \(customer.task.title)업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.number) 번 고객 \(customer.task.title)업무 종료")
    }
    static func startLoanWork(customer: Customer) {
        print("\(customer.number) 번 고객 \(customer.task.title)업무 시작")
        Thread.sleep(forTimeInterval: 1.1)
        print("\(customer.number) 번 고객 \(customer.task.title)업무 종료")
    }
}

