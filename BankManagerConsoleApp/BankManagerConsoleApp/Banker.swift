//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/07.
//

import Foundation

struct Banker {
    func work(for customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: customer.consultingTime)
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
