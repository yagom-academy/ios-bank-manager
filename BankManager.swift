//
//  BankManager.swift
//  Created by 레옹아범, 혜모리.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    var customer: Customer?
    
    func work() {
        guard let customer = customer else { return }
        
        let serialQueue = DispatchQueue(label: "WorkQueue")
        let queueItem = DispatchWorkItem {
            print("\(customer.waitingNumber)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: BankOption.processingTime)
            print("\(customer.waitingNumber)번 고객 업무 완료")
        }
        
        serialQueue.sync(execute: queueItem)
    }
}
