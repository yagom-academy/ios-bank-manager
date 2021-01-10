//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class ConsoleController {
    var bankManager = BankManager()
    
    func recieveUserInput() -> String {
        print(" 1 : 은행개점 \n 2 : 종료\n 입력 : ", terminator: "")
        
        guard let userInput = readLine() else {
            print("잘못된 입력값입니다. 다시 시도해주세요.")
            runProgram()
            return "2"
        }
        
        return userInput
    }
    
    func operateUserInput(_ input: String) {
        switch input {
        case "1":
            manageBank()
            runProgram()
        case "2":
            break
        default :
            print("잘못된 입력값입니다. 다시 시도해주세요.")
            runProgram()
        }
    }
    
    func manageBank() {
        bankManager = BankManager()
        
        do {
            try bankManager.openBank()
        } catch {
            switch error {
            case BankOperationError.invalidValue:
                print("알 수 없는 에러가 발생했습니다.")
                break
            default:
                break
            }
        }
        
        bankManager.closeBank()
    }
    
    func runProgram() {
        bankManager = BankManager()
        let selectedMenu = consoleController.recieveUserInput()
        consoleController.operateUserInput(selectedMenu)
    }
}

let consoleController = ConsoleController()
consoleController.runProgram()

