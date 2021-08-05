//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let bank = Bank()
var bankManager = BankManager(bank: bank)

func main() {
    var flag = true
    while flag {
        let userInput = bankManager.takeAnswer()
        switch userInput {
        case BankMenu.open:
            bankManager.start()
        case BankMenu.exit:
            bankManager.end()
            flag = false
        default:
            flag = true
        }
    }
}

main()
