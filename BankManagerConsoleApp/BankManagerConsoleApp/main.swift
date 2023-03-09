//
//  BankManagerConsoleApp - main.swift
//  Created by Rowan, 릴라. 
//  Copyright © yagom academy. All rights reserved.
//

func makeBank(loanBanker: Int, depositBanker: Int) -> Bank {
    let loanBankers = Array(repeating: Banker(department: .loan), count: loanBanker)
    let depositBankers = Array(repeating: Banker(department: .deposit), count: depositBanker)
    let bank = Bank(loanBankers: loanBankers, depositBankers: depositBankers)
    return bank
}

let bank = makeBank(loanBanker: 1, depositBanker: 2)
var bankManager = BankManager(bank: bank)

bankManager.start()
