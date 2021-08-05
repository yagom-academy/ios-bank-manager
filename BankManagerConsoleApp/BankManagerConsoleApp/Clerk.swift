//
//  Clerk.swift
//  BankManagerConsoleApp
//
//  Created by yun on 2021/08/02.
//

import Foundation

struct Clerk {
    let businessProcessingTime: Double = 0.7
    
    func doTask(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: businessProcessingTime)
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
