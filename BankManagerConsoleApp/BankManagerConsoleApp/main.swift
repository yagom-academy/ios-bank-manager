//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let yagomBank: Bank = Bank()
let yagomBankController: BankController = BankController(of: yagomBank, tellerNumber: 1)
let yagomConsoleController = ConsoleController()

yagomConsoleController.start(with: yagomBankController)
