//
//  MenuOperation.swift
//  BankManagerConsoleApp
//
//  Created by 양호준 on 2021/12/30.
//

import Foundation

struct MenuOperation {
    var bankManager: BankManager
    
    private func printMenu() {
        print(Menu.initialMessage, terminator: " ")
    }
    
    private func receiveInput() -> String {
        guard let input = readLine() else {
            return Menu.Option.invalidInput
        }
        
        return input
    }
    
    mutating func runMenu() {
        printMenu()
        let input = receiveInput()
        
        switch input {
        case Menu.Option.bankOpen:
            bankManager.operateBankSystem()
            runMenu()
        case Menu.Option.bankclosed:
            return
        default:
            print(Menu.Error.wrongInput)
            runMenu()
        }
    }
}
