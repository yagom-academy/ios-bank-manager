//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//MARK: - 타입
fileprivate enum MenuOption: String {
    case openBank = "1"
    case exit = "2"
}

//MARK: - 메서드
fileprivate func showMenu() {
    let menu = """
        1 : 은행개점
        2 : 종료
        입력 :
        """
    print(menu, terminator: " ")
}

fileprivate func getUserInput() throws -> MenuOption {
    guard let input = readLine(),
          let menuOption = MenuOption(rawValue: input) else {
        throw BankManagerError.invalidUserInput
    }
    
    return menuOption
}

fileprivate func runProgram() {
    while true {
        do {
            showMenu()
            let userInput = try getUserInput()
            
            switch userInput {
            case .openBank:
                bankManager.supplyClientsToBank()
                bankManager.openBank()
            case .exit:
                return
            }
        } catch BankManagerError.invalidUserInput {
            print(BankManagerError.invalidUserInput.description)
            print("다시 입력해주십시오.\n")
        } catch {
            print(error)
        }
    }
}

var bankManager = BankManager()

runProgram()
