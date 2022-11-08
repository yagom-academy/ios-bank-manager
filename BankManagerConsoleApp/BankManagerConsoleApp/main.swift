//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let bankWorkers: [BankWorker] = [BankWorker(bankWork: .deposit),
                                 BankWorker(bankWork: .deposit),
                                 BankWorker(bankWork: .loan)]
let bankManager: BankManager = BankManager(bankWorkers: bankWorkers)
var bank: Bank = Bank(bankManager: bankManager)

bank.openSystem()
