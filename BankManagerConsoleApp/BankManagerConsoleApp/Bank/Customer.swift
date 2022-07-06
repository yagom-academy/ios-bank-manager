//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/07/01.
//

final class Customer {
    let customerNumber: Int
    let business: BankWorkType
    
    init (customerNumber: Int, business: BankWorkType) {
        self.customerNumber = customerNumber
        self.business = business
    }
}
