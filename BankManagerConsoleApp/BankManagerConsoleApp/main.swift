//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func getInput() {
    let isContinue = true
    
    while isContinue {
        var bankManager = BankManager()
        InputStateMessage.printInputProcessText(state: .initialization)
        guard let userInput: String = readLine() else {
            InputStateMessage.printInputProcessText(state: .error)
            return
        }
        switch userInput {
        case Menu.open.rawValue:
            bankManager.openBank()
        case Menu.close.rawValue:
            return
        default:
            InputStateMessage.printInputProcessText(state: .inputError)
        }
    }
}

getInput()
