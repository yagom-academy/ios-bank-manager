//
//  BankManagerConsoleApp - main.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
//

let bank = Bank(loanBankerCount: 1, depositBankerCount: 2)
var bankManager = BankManager(bank: bank)

bankManager.start()
