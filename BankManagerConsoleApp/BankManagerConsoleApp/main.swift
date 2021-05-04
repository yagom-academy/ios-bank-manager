//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager(
    bank: Bank(numberOfBankTeller: 3),
    consoleViewer: ConsoleViewController(),
    randomGenerator: RandomGenerator()
)
bankManager.start()
