//  BankManagerConsoleApp - Customer.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

struct Customer {
    let waitingNumber: Int
    let bankingService: BankingService
    static var lastWaitingNumber: Int = 0
    
    init(waitingNumber: Int, bankingService: BankingService) {
        self.waitingNumber = waitingNumber
        self.bankingService = bankingService
    }
}

extension Customer {
    static func make(count: Int = 10) -> [Customer] {
        var customers: [Customer] = []
        
        for waitingNumber in 1...count {
            let bankingService: BankingService = BankingService.random() ?? .deposit
            let customer: Customer = Customer(waitingNumber: lastWaitingNumber + waitingNumber,
                                              bankingService: bankingService)
            
            customers.append(customer)
        }
        
        lastWaitingNumber += count
        
        return customers
    }
    
    static func reset() {
       lastWaitingNumber = 0
    }
}

extension Customer: Equatable {
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        return (lhs.waitingNumber == rhs.waitingNumber) && (lhs.bankingService == rhs.bankingService)
    }
}
