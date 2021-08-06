//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bank = Bank.init()
bank.addBanker(howMany: 2, type: .deposit)
bank.addBanker(howMany: 1, type: .loan)
bank.startTask()
