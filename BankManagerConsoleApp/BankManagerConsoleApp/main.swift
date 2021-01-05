//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

//var bankManager = BankManager()
//private var selectedMenu = bankManager.selectMenu()
//
//while selectedMenu == 1 {
//    print("은행개점")
//    selectedMenu = bankManager.selectMenu()
//}
//print("종료")





func openBank() {
    
}

struct ConsoleController {
    func printMenu() {
        print(" 1 : 은행개점 \n 2 : 종료\n 입력 : ", terminator: "")
        guard let userInput = readLine() else {
            print("잘못된 입력값입니다. 다시 시도해주세요.")
            printMenu()
            return
        }
        
        checkUserInput(userInput)
    }
    
    func checkUserInput(_ input: String) {
        switch input {
        case "1":
            print("abc")
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
