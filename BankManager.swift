//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func 업무처리(customer: Customer) {
        print("\(customer.getWaitingNumber())번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(customer.getWaitingNumber())번 고객 업무 완료")
    }
}
