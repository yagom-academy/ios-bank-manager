//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by yyss99, 비모 on 2023/07/13.
//

import Foundation

struct BankClerk {
    func work(customerNumber: Int) {
        print("\(customerNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customerNumber)번 고객 업무 완료")
    }
}
