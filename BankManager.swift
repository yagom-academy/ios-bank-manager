//
//  BankManager.swift
//  Created by 레옹아범, 혜모리.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    static let numberOfDepositManager = 2
    static let numberOfLoanManager = 1
    static let depositManager = DispatchSemaphore(value: numberOfDepositManager)
    static let loanManager = DispatchSemaphore(value: numberOfLoanManager)
    
    static func work(for customer: Customer, duty: Banking) {
        let workQueue = DispatchQueue(label: "WorkQueue")
        
        let queueItem = DispatchWorkItem {
            print("\(customer.waitingNumber)번 고객 \(duty)업무 시작")
            Thread.sleep(forTimeInterval: duty.time)
            print("\(customer.waitingNumber)번 고객 \(duty)업무 완료")
        }
        
        workQueue.sync(execute: queueItem)
    }
    
    static func divideWork(accordingTo customer: Customer) {
        switch customer.desiredBanking {
        case .deposit:
            DispatchQueue.global().async(group: Bank.workingGroup) {
                depositManager.wait()
                work(for: customer, duty: customer.desiredBanking)
                depositManager.signal()
            }
        case .loan:
            DispatchQueue.global().async(group: Bank.workingGroup) {
                loanManager.wait()
                work(for: customer, duty: customer.desiredBanking)
                loanManager.signal()
            }
        }
    }
}
