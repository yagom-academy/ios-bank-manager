//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bank = Bank(numberOfClerks: 1)
var bankManager = BankManager(bank: bank)

bankManager.startConsoleProgram()
