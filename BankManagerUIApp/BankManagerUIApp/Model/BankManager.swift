//
//  BankManager.swift
//  Created by 레옹아범, 혜모리.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    static var isRunningWork = true
    static let workingGroup = DispatchGroup()
    
    private static let depositManager = DispatchSemaphore(value: 2)
    private static let loanManager = DispatchSemaphore(value: 1)
    
    private init() {}
    
    static func divideWork(accordingTo customer: Customer) {
        switch customer.desiredBanking {
        case .deposit:
            DispatchQueue.global().async(group: workingGroup, qos: .background) {
                depositManager.wait()
                work(for: customer)
                depositManager.signal()
            }
        case .loan:
            DispatchQueue.global().async(group: workingGroup, qos: .background) {
                loanManager.wait()
                work(for: customer)
                loanManager.signal()
            }
        }
    }
    
    private static func work(for customer: Customer) {
        let workQueue = DispatchQueue(label: "WorkQueue")
        
        let queueItem = DispatchWorkItem(qos: .userInitiated) {
            if isRunningWork {
                NotificationCenter.default.post(name: .workingNoti, object: customer)
                Thread.sleep(forTimeInterval: customer.desiredBanking.time)
                NotificationCenter.default.post(name: .completeNoti, object: customer)
            }
        }
        
        workQueue.sync(execute: queueItem)
    }
    
    static func resetWork() {
        isRunningWork = false
        
        workingGroup.wait()
    }
}
