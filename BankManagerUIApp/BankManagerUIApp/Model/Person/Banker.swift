//  BankManagerConsoleApp - Banker.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

import Foundation

struct Banker {
    func work(_ customer: Customer, completion: @escaping () -> Void) {
        printStartingMessage(of: customer)
        postStartWorkNotification(of: customer)
        
        customer.bankingService.request()
        
        printCompletingMessage(of: customer)
        postCompleteWorkNotification(of: customer)
        
        completion()
    }
    
    private func printStartingMessage(of customer: Customer) {
        let startingMessage: String = "\(customer.waitingNumber)번 고객 \(customer.bankingService.name)업무 시작"
        
        print(startingMessage)
    }
    
    private func printCompletingMessage(of customer: Customer) {
        let completeMessage: String = "\(customer.waitingNumber)번 고객 \(customer.bankingService.name)업무 완료"
        
        print(completeMessage)
    }
    
    private func postStartWorkNotification(of customer: Customer) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .startWork, object: customer.waitingNumber)
        }
    }
    
    private func postCompleteWorkNotification(of customer: Customer) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .completeWork, object: customer.waitingNumber)
        }
    }
}
