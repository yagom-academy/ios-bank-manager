//
//  BankManagerConsoleApp - main.swift
//  Created by Charlotte, Soll. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Menu: String, CustomStringConvertible {
    case open = "1 : 은행 개점"
    case close = "2 : 종료"
    case input = "입력 : "
    
    var description: String {
        return self.rawValue
    }
}

func printMenu() {
    print("\(Menu.open)\n\(Menu.close)")
    print(Menu.input, terminator: "")
}

func readUserInput() -> String? {
    guard let userInput: String = readLine() else {
        return nil
    }
    return userInput
}

func checkUserInput() -> Bool {
    let userChoice = readUserInput()
    if userChoice == "1" {
        return true
    } else {
        return false
    }
}

func startTask() {
    var bankManagers: [BankManager] = []
    bankManagers.append(BankManager(task: .deposit))
    bankManagers.append(BankManager(task: .deposit))
    bankManagers.append(BankManager(task: .loan))

    let bank = Bank(bankManagers: bankManagers)
    bank.openBank()
}

func taskManager() {
    while true {
        printMenu()
        if checkUserInput() == false {
            return
        }
        startTask()
    }
}

taskManager()


