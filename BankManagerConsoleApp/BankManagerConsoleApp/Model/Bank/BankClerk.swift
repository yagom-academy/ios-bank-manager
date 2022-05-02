//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 쿼카, 두기 on 2022/04/29.
//
import Foundation

struct BankClerk {
    private enum Constant {
        static let workStartText = "번 고객 업무 시작"
        static let workEndText = "번 고객 업무 시작"
        static let workTime = 0.7
    }
    
    func work(customer: Customer) {
        print("\(customer.number) \(Constant.workStartText)")
        Thread.sleep(forTimeInterval: Constant.workTime)
        print("\(customer.number) \(Constant.workEndText)")
    }
}

