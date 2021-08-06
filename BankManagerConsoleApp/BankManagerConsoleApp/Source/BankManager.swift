//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let bank: Bank
    
    init(departmentInformation: (departmentCategory: BankingCategory, numberOfDepartmentTellers: Int)...) {
        bank = Bank(departmentInformation: departmentInformation)
    }
    
    func runBank() {
        let visitors = createCustomers()
        bank.receive(customers: visitors)
        let elapsedTime = trackTime(while: bank.serveCustomers)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(visitors.count)명이며, 총 업무시간은 \(String(format: "%.2f", elapsedTime))초입니다.")
        bank.close()
    }
    
    private func generateRandomCustomerNumber() -> UInt {
        let minimumCustomerNumber: UInt = 10
        let maximumCustomerNumber: UInt = 30
        return UInt.random(in: minimumCustomerNumber...maximumCustomerNumber)
    }
    
    private func createCustomers() -> [Customer] {
        return Array(0..<generateRandomCustomerNumber()).map { _ in
            return Customer(desiredTask: BankingCategory.randomTask, waitingNumber: bank.takeNumberTicket())
        }
    }
    
    private func trackTime(while job: () -> ()) -> TimeInterval {
        let startTime = Date()
        job()
        return Date().timeIntervalSince(startTime)
    }
}
