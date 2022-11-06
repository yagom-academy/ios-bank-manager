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
        print("\(customer.waitingNumber)번 고객 업무 시작")
        usleep(700000)
        print("\(customer.waitingNumber)번 고객 업무 완료")
    }
}
