//
//  Bankingtype.swift
//  BankManagerConsoleApp
//
//  Created by Goat, Andrew on 2023/03/14.
//

import Foundation

struct BankingType {
    let customer: Customer 
    let customerNumber: Int
    
    init?(customerNumber: Int){
        guard let customer = Customer.allCases.randomElement() else { return nil }
    
        self.customer = customer
        self.customerNumber = customerNumber
    }
}
