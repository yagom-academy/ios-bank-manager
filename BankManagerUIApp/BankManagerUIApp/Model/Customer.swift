//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/07.
//

struct Customer {
    let numberTicket: String
    let business: Business?
    
    init(numberTicket: String) {
        self.numberTicket = numberTicket
        self.business = Business.allCases.randomElement()
    }
}

extension Customer: Equatable {
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        let result: Bool = lhs.business == rhs.business &&
                        lhs.numberTicket == rhs.numberTicket
        
        return result
    }
}
