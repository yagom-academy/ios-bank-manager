//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//let bankClerk = BankClerk() - 디폴트로 bank에서 생성자 만들어주기
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
