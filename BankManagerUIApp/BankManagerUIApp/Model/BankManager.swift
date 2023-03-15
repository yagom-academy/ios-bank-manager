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
        
        let queueItem = DispatchWorkItem(qos: .userInitiated) {
            print("\(customer.waitingNumber)번 고객 \(customer.desiredBanking)업무 시작")
            
            if MainViewController.isRunningWork {
                NotificationCenter.default.post(name: .workingNoti, object: customer)
                Thread.sleep(forTimeInterval: customer.desiredBanking.time)
                NotificationCenter.default.post(name: .completeNoti, object: customer)
            }
            
            print("\(customer.waitingNumber)번 고객 \(customer.desiredBanking)업무 완료")
        }
        
        workQueue.sync(execute: queueItem)
    }
    
    static func divideWork(accordingTo customer: Customer) {
        switch customer.desiredBanking {
        case .deposit:
            DispatchQueue.global().async(group: Bank.workingGroup, qos: .background) {
                depositManager.wait()
                work(for: customer)
                depositManager.signal()
            }
        case .loan:
            DispatchQueue.global().async(group: Bank.workingGroup, qos: .background) {
                loanManager.wait()
                work(for: customer)
                loanManager.signal()
            }
        }
    }
}
