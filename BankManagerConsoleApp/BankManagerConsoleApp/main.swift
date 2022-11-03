//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var jlBank: Bank = Bank()

runBankManagerConsoleApp()

func runBankManagerConsoleApp() {
    jlBank.displayMenu()
    let input: String? = jlBank.getInput()
    switch input {
    case "1":
        jlBank.openBank()
        runBankManagerConsoleApp()
    case "2":
        return
    default:
        print("잘못된 입력입니다.")
        runBankManagerConsoleApp()
    }
}
