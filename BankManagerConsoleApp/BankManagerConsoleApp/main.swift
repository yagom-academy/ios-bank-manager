//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//MARK: Properties
let bank = Bank()
var bankManager = BankManager(bank: bank)

//MARK: BankMangerConsoleApp Execute Function
func main() {
    var flag = true
    let userInput = bankManager.takeAnswer()

    while flag {
        switch userInput {
        case BankMenu.openBank:
            bankManager.start()
            main()
        case BankMenu.exit:
            bankManager.end()
            flag = false
        default:
            flag = true
        }
    }
}

main()
