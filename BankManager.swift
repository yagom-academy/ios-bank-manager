//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func work(customer: Customer) -> Double {
        print("\(customer.priority)번 고객 업무 시작")
        usleep(UInt32(customer.taskTime * 1000000))
        print("\(customer.priority)번 고객 업무 완료")
        
        return customer.taskTime
    }
}
