//
//  BankManager.swift
//  Created by 레옹아범, 혜모리.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

class BankManager {
    var customer: Customer?
    let duty: Banking
    
    init(duty: Banking) {
        self.duty = duty
    }
    
    func work() {
        guard let customer = customer else { return }
        
        let serialQueue = DispatchQueue(label: "WorkQueue")
        let time = duty == .deposit ? BankOption.processingTimeAtDeposit : BankOption.processingTimeAtLoan
        
        let queueItem = DispatchWorkItem {
            print("\(customer.waitingNumber)번 고객 \(self.duty.rawValue)업무 시작")
            Thread.sleep(forTimeInterval: time)
            print("\(customer.waitingNumber)번 고객 \(self.duty.rawValue)업무 완료")
        }
        
        serialQueue.sync(execute: queueItem)
    }
}
