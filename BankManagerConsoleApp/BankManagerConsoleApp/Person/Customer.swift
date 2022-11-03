//  BankManagerConsoleApp - Customer.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

struct Customer: Equatable {
    let waitingNumber: Int
    let bankingService: BankingService
    
    init(waitingNumber: Int, bankingService: BankingService) {
        self.waitingNumber = waitingNumber
        self.bankingService = bankingService
    }
}

extension Customer {
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.idCardNumber == rhs.idCardNumber
    }
}
