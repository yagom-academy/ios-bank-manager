//  BankManagerConsoleApp - Banker.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct Banker {
    func work(_ customer: Customer, completion: @escaping () -> Void) {
        let startingMessage: String = "\(customer.waitingNumber)번 고객 \(customer.bankingService.name)업무 시작"
        let endingMessage: String = "\(customer.waitingNumber)번 고객 \(customer.bankingService.name)업무 완료"
        
        print(startingMessage)
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .startWork, object: customer.waitingNumber)
        }
        customer.bankingService.request()
        print(endingMessage)
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .completeWork, object: customer.waitingNumber)
        }
            
        completion()
    }
}
