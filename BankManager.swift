//
//  BankManager.swift
//  Created by 레옹아범, 혜모리.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    static func work(for customer: Customer, duty: Banking) {
        let workQueue = DispatchQueue(label: "WorkQueue")
        let time = duty == .deposit ? BankOption.processingTimeAtDeposit : BankOption.processingTimeAtLoan
        
        let queueItem = DispatchWorkItem {
            print("\(customer.waitingNumber)번 고객 \(duty.rawValue)업무 시작")
            Thread.sleep(forTimeInterval: time)
            print("\(customer.waitingNumber)번 고객 \(duty.rawValue)업무 완료")
        }
        
        workQueue.sync(execute: queueItem)
    }
}
