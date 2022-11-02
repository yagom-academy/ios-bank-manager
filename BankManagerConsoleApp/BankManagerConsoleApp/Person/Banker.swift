//  BankManagerConsoleApp - Banker.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

struct Banker: Person {
    var name: String?
    var idCardNumber: String?
    
    func work(_ customer: Customer) {
        print("\(customer.waitingNumber)번 고객 업무 시작")
        customer.bankingService.service()
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
