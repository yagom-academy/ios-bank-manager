//
//  BankerOperation.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Minii All rights reserved.

import Foundation

class BankerOperation: Operation, BankOperationProcessing {
    var customer: Customer
    
    init(customer: Customer) {
        self.customer = customer
    }
    
    override func main() {
        work(customer: customer)
    }
}
