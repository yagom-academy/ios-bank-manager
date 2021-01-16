//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class ConsoleController {
    private var bankManager = BankManager()
    
    private func recieveUserInput() -> String {
        print(ConsoleOutput.menuChoice.message, terminator: "")
        
        guard let userInput = readLine() else {
            print(ConsoleOutput.invalidInput.message)
            runProgram()
            return "2"
        }
        
        return userInput
    }
    
    private func operateUserInput(_ input: String) {
        switch input {
        case "1":
            manageBank()
            runProgram()
        case "2":
            break
        default :
            print(ConsoleOutput.invalidInput.message)
            runProgram()
        }
    }
    
    private func manageBank() {
        bankManager = BankManager()
        
        do {
            try bankManager.openBank()
        } catch {
            switch error {
            case BankOperationError.unknownError:
                print(BankOperationError.unknownError.rawValue)
                break
            default:
                print(BankOperationError.unknownError.rawValue)
                break
            }
        }
        
        bankManager.closeBank()
    }
    
    fileprivate func runProgram() {
        bankManager = BankManager()
        let selectedMenu = consoleController.recieveUserInput()
        consoleController.operateUserInput(selectedMenu)
    }
}

let consoleController = ConsoleController()
consoleController.runProgram()

