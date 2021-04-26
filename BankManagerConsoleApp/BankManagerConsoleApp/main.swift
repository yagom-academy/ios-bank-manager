//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let setOfBankManager = Set<BankManager>([BankManager(counterNumber: 1)])
let testBank = Bank(bankManagers: setOfBankManager)

testBank.open()
