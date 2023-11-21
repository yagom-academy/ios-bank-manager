//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

func userMenu(bankManager: BankManager) {
    while true {
        print(ConsoleString.menu, terminator: "")
        
        switch readLine() {
        case "1":
            bankManager.bank.open()
        case "2":
            return
        default:
            print(ConsoleString.wrongInput)
        }
    }
}

var bankManager = BankManager(bankName: "Hisop")

userMenu(bankManager: bankManager)

