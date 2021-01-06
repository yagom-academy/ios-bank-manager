//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct ConsoleController {
    func printMenu() {
        print(" 1 : 은행개점 \n 2 : 종료\n 입력 : ", terminator: "")
        guard let userInput = readLine() else {
            print("잘못된 입력값입니다. 다시 시도해주세요.")
            printMenu()
            return
        }
        
        checkUserInput(input: userInput)
    }
    
    func checkUserInput(input: String) {
        switch input {
        case "1":
            var bankManager = BankManager()
            bankManager.openBank()
            printMenu()
        case "2":
            break
        default :
            print("잘못된 입력값입니다. 다시 시도해주세요.")
            printMenu()
        }
    }
}

let consoleController = ConsoleController()
consoleController.printMenu()

