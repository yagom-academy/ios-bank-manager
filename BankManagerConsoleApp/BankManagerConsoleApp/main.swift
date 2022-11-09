//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let randomNumber = Int.random(in: 10...30)
let customerQueue = CustomerQueue<Customer>()
var kbBank = Bank(
    numberOfCustomer: randomNumber,
    customerQueue: customerQueue
)

kbBank.openUp()
