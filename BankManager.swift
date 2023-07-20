//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let group: DispatchGroup = DispatchGroup()
    private let semaphore: DispatchSemaphore

    init(people semaphore: Int) {
        self.semaphore = DispatchSemaphore(value: semaphore)
    }
    
    func work(for customer: Customer) {
        guard let serviceType = customer.getBankingServiceType() else { return }
        
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            print("\(customer.getWaitingNumber())번 고객 \(serviceType)업무 시작")
            Thread.sleep(forTimeInterval: customer.getBankingProcessTime())
            print("\(customer.getWaitingNumber())번 고객 \(serviceType)업무 완료")
            semaphore.signal()
        }
    }
    
    func finishWork() {
        group.wait()
    }
}
