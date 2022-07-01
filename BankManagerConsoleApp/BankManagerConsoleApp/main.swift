//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var bank = Bank(bankManager: BankManager(), queue: CustomerQueue())
bank.displayMenu()
bank.selectMenu()
