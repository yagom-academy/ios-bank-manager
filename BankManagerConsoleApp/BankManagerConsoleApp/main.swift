//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
//let firstTeller = Teller()

let bank = Bank(teller: Teller(tellerIndex: 1))
bank.startService()
