//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let bank: Bank
    
    init(_ departmentInformation: (departmentCategory: BankingCategory, numberOfDepartmentTellers: Int)...) {
        bank = Bank(departmentInformation: departmentInformation)
    }
    
    func runBank() {
        let visitors = createCustomers()
        bank.receive(customers: visitors)
        bank.serveCustomers()
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
}
