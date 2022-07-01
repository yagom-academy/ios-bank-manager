//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let manager = BankManager()
let queue = CustomerQueue()
var bank = Bank(employee: manager, customer: queue)

bank.start()
