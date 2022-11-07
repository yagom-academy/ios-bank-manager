//  BankManagerConsoleApp - Banker.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

struct Banker {
    func work(_ customer: Customer, completion: @escaping () -> Void) {
        let startingMessage: String = "\(customer.waitingNumber)번 고객 \(customer.bankingService.rawValue)업무 시작"
        let endingMessage: String = "\(customer.waitingNumber)번 고객 \(customer.bankingService.rawValue)업무 완료"
        
        print(startingMessage)
        customer.bankingService.request()
        print(endingMessage)
        
        completion()
    }
}
