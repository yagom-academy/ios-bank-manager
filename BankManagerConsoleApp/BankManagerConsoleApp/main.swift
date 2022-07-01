//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func createCustomer() -> [Customer] {
    var customers = [Customer]()
    for number in 1...Int.random(in: 10...30) {
        let customer = Customer(task: "업무\(number)")
        customers.append(customer)
    }
    return customers
}

let bank = Bank()

bank.doBusiness()
