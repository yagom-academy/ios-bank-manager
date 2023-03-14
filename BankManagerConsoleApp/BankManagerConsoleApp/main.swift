//
//  BankManagerConsoleApp - main.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
//

let bank = Bank(loanBankerCount: 1, depositBankerCount: 2)
let customerReceiver = CustomerReceiver()
var bankManager = BankManager(bank: bank, customerReceiver: customerReceiver)

bankManager.start()
