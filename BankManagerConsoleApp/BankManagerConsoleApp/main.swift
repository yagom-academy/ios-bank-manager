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
    let userInput = bankManager.takeAnswer()

    while flag {
        switch userInput {
        case BankMenu.open:
            bankManager.start(completion: <#T##() -> Bool#>)
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
