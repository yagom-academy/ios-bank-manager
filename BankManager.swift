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
        switch customer.task {
        case .deposit:
            Thread.sleep(forTimeInterval: 1.1)
        case .loan:
            Thread.sleep(forTimeInterval: 0.7)
        }
        print("\(customer.order)번 고객 \(customer.task) 완료")
    }
}
