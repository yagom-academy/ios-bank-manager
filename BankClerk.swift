//
//  BankClerk.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankClerk {
    func carryOutBankService(_ customer: Customer) {
        startTask(customer.waitingNumber)
        Thread.sleep(forTimeInterval: customer.taskTime)
        endTask(customer.waitingNumber)
    }
    
    private func startTask(_ waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 시작")
    }
    
    private func endTask(_ waitingNumber: Int) {
        print("\(waitingNumber)번 고객 업무 완료")
    }
}
