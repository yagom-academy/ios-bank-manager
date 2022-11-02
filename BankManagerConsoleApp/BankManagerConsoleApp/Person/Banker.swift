//  BankManagerConsoleApp - Banker.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

struct Banker: Person {
    let name: String?
    let idCardNumber: String?
    
    init(name: String? = nil, idCardNumber: String? = nil) {
        self.name = name
        self.idCardNumber = idCardNumber
    }
    
    func work(_ customer: Customer) {
        let startingMessage: String = "\(customer.waitingNumber)번 고객 업무 시작"
        let endingMessage: String = "\(customer.waitingNumber)번 고객 업무 완료"
        
        print(startingMessage)
        customer.bankingService.service()
        print(endingMessage)
    }
}
