//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let customerQueue = CustomerQueue<Customer>()
var bankManager = BankManager(customerQueue: customerQueue)
bankManager.openUp()
