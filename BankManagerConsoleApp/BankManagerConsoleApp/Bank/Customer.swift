//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/07/01.
//

final class Customer {
    let customerNumber: Int
    let business: WorkType
    
    init (customerNumber: Int, business: WorkType) {
        self.customerNumber = customerNumber
        self.business = business
    }
}
