//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func provideService(to customer: Customer?) {
        guard let customer = customer else {
            return
        }

        print("\(customer.number)번 고객 업무 시작")
        usleep(700000)
        print("\(customer.number)번 고객 업무 완료")
    }
}
