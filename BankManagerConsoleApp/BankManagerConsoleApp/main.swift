//
//  BankManagerConsoleApp - main.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
//

let loanBanker = Banker(department: .loan)
let depositBanker = Banker(department: .deposit)
let depositBanker2 = Banker(department: .deposit)

let depositBankers = [depositBanker, depositBanker2]
let loanBankers = [loanBanker]

let bank = Bank(loanBankers: loanBankers, depositBankers: depositBankers)
var bankManager = BankManager(bank: bank)

bankManager.start()
