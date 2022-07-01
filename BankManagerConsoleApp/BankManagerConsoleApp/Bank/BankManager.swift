//
//  BankManager.swift
//  Created by Kiwi, Kay.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var numberOfCustomers: Int = 0
var lineOfCustomers = BankManagerQueue<Customer>()

func generateRandomNumberOfCustomers() {
    numberOfCustomers = Int.random(in: 10...30)
}

func insertCustomersIntoQueue() {
    for element in 1...numberOfCustomers {
        let customer: Customer = Customer(customerNumber: element)
        lineOfCustomers.enqueue(data: customer)
    }
}
