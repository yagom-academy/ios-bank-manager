//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let handlingTime: TimeInterval = 0.7
    
    func handle(customer: Customer) {
        let customerNumber = customer.number
        
        print("\(customerNumber)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: handlingTime)
        print("\(customerNumber)번 고객 업무 완료")
    }
}
