//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bankManager = BankManager(bank: Bank(numberOfBankTeller: 1),
                              consoleViewer: ConsoleViewController(),
                              randomGenerator: RandomGenerator())
bankManager.start()
