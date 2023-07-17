//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by yyss99, 비모 on 2023/07/13.
//

import Foundation

struct BankClerk {
    static let workTime: Double = 0.7
    
    func work(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: BankClerk.workTime)
        print("\(customerNumber)번 고객 업무 완료")
    }
}
