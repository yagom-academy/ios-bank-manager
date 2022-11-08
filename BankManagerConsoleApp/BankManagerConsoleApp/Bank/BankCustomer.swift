//
//  BankCustomer.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/04.
//

struct BankCustomer {
    private static var customerNumber: Int = 0
    let waitingNumber: Int
    let type: CustomerType
    
    init(customerType: CustomerType) {
        Self.customerNumber += 1
        self.waitingNumber = Self.customerNumber
        self.type = customerType
    }
}
