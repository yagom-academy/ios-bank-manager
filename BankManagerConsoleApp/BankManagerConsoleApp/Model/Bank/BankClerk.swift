//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/29.
//
import Foundation

struct BankClerk {
    private enum Constant {
        static let startWork = "번 고객 업무 시작"
        static let endWork = "번 고객 업무 시작"
        static let workTime = 0.7
    }
    
    func work(customer: Customer) {
        print("\(customer.number) \(Constant.startWork)")
        Thread.sleep(forTimeInterval: Constant.workTime)
        print("\(customer.number) \(Constant.endWork)")
    }
}

