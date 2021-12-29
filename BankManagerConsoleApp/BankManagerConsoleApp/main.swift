//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printMenu() {
    let menu = """
          1 : 은행개점
          2 : 종료
          입력 :
          """
    print(menu, terminator: " ")
}

func runProgram() {
    let bankPrinter = BankPrinter()
    
    while true {
        let bank = BankFactory.createBank(with: bankPrinter)
        printMenu()
        let userInput = readLine()
        
        switch userInput {
        case "1":
            bank.open()
        case "2":
            return
        default:
            continue
        }
    }
}

runProgram()
