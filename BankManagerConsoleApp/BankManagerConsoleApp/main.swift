//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let randomNumber = Int.random(in: 10...30)
let customerQueue = CustomerQueue<Customer>()
var bankManager = BankManager(numberOfCustomer: randomNumber, customerQueue: customerQueue)

bankManager.openUp()
