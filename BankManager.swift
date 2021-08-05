//
//  BankManager.swift
//  Created by Charlotte, Soll.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func startWork(_ customer: Customer) {
        print("\(customer.order)번 고객 업무 시작")
        usleep(700000)
        print("\(customer.order)번 고객 업무 완료")
    }
}
