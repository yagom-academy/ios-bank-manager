//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let randomNumber = Int.random(in: 10...30)
let customerQueue = CustomerQueue<Customer>()
let mene = BankManager(name: "mene")
var kbBank = Bank(
    manager: mene,
    numberOfCustomer: randomNumber,
    customerQueue: customerQueue
)

kbBank.openUp()
