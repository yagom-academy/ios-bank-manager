//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/29.
//
import Foundation

struct BankClerk {
    func work(customer: Customer) {
        print("\(customer.number) 번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.number) 번 고객 업무 시작")
    }
}

