//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

func userMenu(bankManager: BankManager) {
    var isRunning = true
    while isRunning {
        print(ConsoleString.menu, terminator: "")
        
        switch readLine() {
        case "1":
            bankManager.bank.open()
        case "2":
            isRunning = false
        default:
            print(ConsoleString.wrongInput)
        }
    }
}

var bankManager = BankManager(bankName: "Hisop")

userMenu(bankManager: bankManager)

