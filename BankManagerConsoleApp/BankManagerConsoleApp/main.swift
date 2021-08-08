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
    return readLine()
}

func checkUserInput() -> Bool {
    let validValue:String = "1"
    return readUserInput() == validValue
}

func prepareBank() -> Bank {
    var bankManagers: [BankManager] = []
    bankManagers.append(BankManager(task: .deposit))
    bankManagers.append(BankManager(task: .deposit))
    bankManagers.append(BankManager(task: .loan))

    let bank = Bank(bankManagers: bankManagers)
    return bank
}

func doTask(by bank: Bank) {
    while true {
        printMenu()
        if checkUserInput() == false {
            return
        }
        bank.openBank()
    }
}

doTask(by: prepareBank())
