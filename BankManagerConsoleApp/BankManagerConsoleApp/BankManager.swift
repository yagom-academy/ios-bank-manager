//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Mangdi, Mene on 2022/11/02.
//

import Foundation

struct BankManager {
    let name: String
    
    func processTask(customer: Customer) {
        print("\(self.name) \(customer.waitingNumber)번 고객 \(customer.requestingTask.name) 업무 시작")
        if customer.requestingTask == .deposit {
            usleep(700000)
        } else {
            usleep(1100000)
        }
        print("\(self.name) \(customer.waitingNumber)번 고객 \(customer.requestingTask.name) 업무 완료")
    }
}
