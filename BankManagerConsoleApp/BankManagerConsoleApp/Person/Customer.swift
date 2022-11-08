//  BankManagerConsoleApp - Customer.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

struct Customer {
    let waitingNumber: Int
    let bankingService: BankingService
    
    init(waitingNumber: Int, bankingService: BankingService) {
        self.waitingNumber = waitingNumber
        self.bankingService = bankingService
    }
}

extension Customer {
    static func make(count: Int = Int.random(in: 10...30)) -> [Customer] {
        var customers: [Customer] = []
        
        for waitingNumber in 1...count {
            let bankingService: BankingService = BankingService.random() ?? .deposit
            let customer: Customer = Customer(waitingNumber: waitingNumber, bankingService: bankingService)
            
            customers.append(customer)
        }
        
        return customers
    }
}

extension Customer: Equatable {
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        return (lhs.waitingNumber == rhs.waitingNumber) && (lhs.bankingService == rhs.bankingService)
    }
}
