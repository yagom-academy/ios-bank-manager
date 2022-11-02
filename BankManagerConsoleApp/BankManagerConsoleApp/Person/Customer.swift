//  BankManagerConsoleApp - Customer.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

struct Customer: Person, Equatable {
    var name: String?
    var idCardNumber: String?
    let waitingNumber: Int
    let bankingService: BankingService
}

extension Customer {
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.idCardNumber == rhs.idCardNumber
    }
}
