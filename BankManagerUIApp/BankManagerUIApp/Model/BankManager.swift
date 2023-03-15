//
//  BankManager.swift
//  Created by 레옹아범, 혜모리.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    private static let depositManager = DispatchSemaphore(value: 2)
    private static let loanManager = DispatchSemaphore(value: 1)
    
    private init() {}
    
    private static func work(for customer: Customer) {
        let workQueue = DispatchQueue(label: "WorkQueue")
        
        NotificationCenter.default.post(name: .workingNoti, object: customer)
        
        let queueItem = DispatchWorkItem {
            print("\(customer.waitingNumber)번 고객 \(customer.desiredBanking)업무 시작")
            Thread.sleep(forTimeInterval: customer.desiredBanking.time)
            print("\(customer.waitingNumber)번 고객 \(customer.desiredBanking)업무 완료")
        }
        
        if MainViewController.isRunningWork == true {
            workQueue.sync(execute: queueItem)
        } else {
            queueItem.cancel()
        }
        
        NotificationCenter.default.post(name: .completeNoti, object: customer)
    }
    
    static func divideWork(accordingTo customer: Customer) {
        switch customer.desiredBanking {
        case .deposit:
            DispatchQueue.global().async(group: Bank.workingGroup, qos: .userInitiated) {
                depositManager.wait()
                work(for: customer)
                depositManager.signal()
            }
        case .loan:
            DispatchQueue.global().async(group: Bank.workingGroup, qos: .userInitiated) {
                loanManager.wait()
                work(for: customer)
                loanManager.signal()
            }
        }
    }
}

