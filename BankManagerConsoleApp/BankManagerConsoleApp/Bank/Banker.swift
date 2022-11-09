//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/04.
//

import Foundation

struct Banker {
    func work(_ customer: BankCustomer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: customer.type.wasteSeconds)
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
