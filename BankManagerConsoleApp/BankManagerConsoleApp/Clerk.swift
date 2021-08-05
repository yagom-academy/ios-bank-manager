//
//  Clerk.swift
//  BankManagerConsoleApp
//
//  Created by yun on 2021/08/02.
//

import Foundation

struct Clerk {
    func doTask(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer.businessType.getName)업무 시작")
        Thread.sleep(forTimeInterval: customer.businessType.processingTime)
        print("\(customer.waitingNumber)번 고객 \(customer.businessType.getName)업무 완료")
    }
}
