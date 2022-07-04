//
//  BankManager.swift
//  Created by Kiwi, Kay.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private var bank: Bank
    private var specialized: WorkType
    private let semaphore = DispatchSemaphore(value: 1)
    
    init(bank: Bank, specialized: WorkType) {
        self.bank = bank
        self.specialized = specialized
    }
    
    func handleCustomers() {
        DispatchQueue.global().async { [self] in
            self.semaphore.wait()
            while !bank.lineOfCustomers.isEmpty {
                guard let customer = bank.lineOfCustomers.dequeue() else { return }
                print("\(customer.customerNumber)번 고객 \(customer.business.name)업무 시작")
                Thread.sleep(forTimeInterval: customer.business.processingTime)
                print("\(customer.customerNumber)번 고객 \(customer.business.name)업무 완료")
                bank.totalTimeOfWork += customer.business.processingTime
            }
            self.semaphore.signal()
        }
    }
}

