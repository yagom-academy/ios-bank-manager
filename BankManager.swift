//
//  BankManager.swift
//  Created by Charlotte, Soll.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let task: Task
    
    func startWork(_ customer: Customer) {
        print("\(customer.order)번 고객 \(customer.task) 시작")
        usleep(700000)
        print("\(customer.order)번 고객 \(customer.task) 완료")
    }
}
