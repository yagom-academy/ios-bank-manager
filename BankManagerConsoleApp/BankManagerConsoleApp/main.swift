//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

fileprivate func printMenu() {
    print(Menu.initialMessage, terminator: " ")
}

fileprivate func receiveInput() -> String {
    guard let input = readLine() else {
        return Menu.Option.invalidInput
    }
    
    return input
}

fileprivate func runMenu(with input: String) {
    let clients = Clients()
    let clerk = BankClerk()
    let bankManager = BankManager(clients: clients,
                                  clerk: clerk,
                                  totalClerkCount: 1)

    switch input {
    case Menu.Option.bankOpen:
        bankManager.operateBankSystem()
        printMenu()
        runMenu(with: receiveInput())
    case Menu.Option.bankclosed:
        return
    default:
        print(Menu.Error.wrongInput)
        printMenu()
        runMenu(with: receiveInput())
    }
}

printMenu()
runMenu(with: receiveInput())
