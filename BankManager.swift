//
//  BankManager.swift
//  Created by 레옹아범, 혜모리.
//  Copyright © yagom academy. All rights reserved.
//
import Foundation

struct BankManager {
    var customer: Customer?
    let serialQueue = DispatchQueue(label: "WorkQueue")
    
    func work() {
        guard let customer = customer else { return }
        
        let queueItem = DispatchWorkItem {
            print("\(customer.number)번 고객 업무 시작")
            print("\(customer.number)번 고객 업무 완료")
        }
        
        serialQueue.asyncAfter(deadline: .now() + 1, execute: queueItem)
    }
    
    func aaa() {
        serialQueue.asyncAfter(deadline: .now() + 1) {
            work()
        }
    }
}
