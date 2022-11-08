//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func task(customer: Customer) {
        print("\(customer.waitingNumber)번 고객 \(customer.purposeOfServie.rawValue)업무 시작")
        
        switch customer.purposeOfServie {
        case .deposit:
            usleep(700000)
        case .loan:
            usleep(1100000)
        }
        print("\(customer.waitingNumber)번 고객 \(customer.purposeOfServie.rawValue)업무 종료")
    }
}
