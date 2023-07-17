//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func work(for customer: Customer, group: DispatchGroup, semaphore: DispatchSemaphore) {
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            print("\(customer.getWaitingNumber())번 고객 업무 시작")
            Thread.sleep(forTimeInterval: customer.getBankingTime())
            print("\(customer.getWaitingNumber())번 고객 업무 완료")
            semaphore.signal()
        }
    }
}
