//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let bankWorker: BankWorker = BankWorker()
let bankManager: BankManager = BankManager(bankWorker: bankWorker)
var bank: Bank = Bank(bankManager: bankManager)

bank.openSystem()
