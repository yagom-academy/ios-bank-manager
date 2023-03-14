//
//  BankManager.swift
//  Created by 레옹아범, 혜모리.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    static let depositManager = DispatchSemaphore(value: BankOption.numberOfDepositManager)
    static let loanManager = DispatchSemaphore(value: BankOption.numberOfLoanManager)
    
    static func work(for customer: Customer, duty: Banking) {
        let workQueue = DispatchQueue(label: "WorkQueue")
        
        let queueItem = DispatchWorkItem {
            print("\(customer.waitingNumber)번 고객 \(duty)업무 시작")
            Thread.sleep(forTimeInterval: duty.time)
            print("\(customer.waitingNumber)번 고객 \(duty)업무 완료")
        }
        
        workQueue.sync(execute: queueItem)
    }
    
    static func workManager(for customer: Customer) {
        switch customer.banking {
        case .deposit:
            DispatchQueue.global().async(group: Bank.workingGroup) {
                depositManager.wait()
                work(for: customer, duty: customer.banking)
                depositManager.signal()
            }
        case .loan:
            DispatchQueue.global().async(group: Bank.workingGroup) {
                loanManager.wait()
                work(for: customer, duty: customer.banking)
                loanManager.signal()
            }
        }
    }
}
