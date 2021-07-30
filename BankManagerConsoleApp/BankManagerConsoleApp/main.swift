//
//  BankManagerConsoleApp - main.swift
//  Created by Charlotte, Soll. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Menu: String, CustomStringConvertible {
    case open = "은행 개점"
    case close = "종료"
    
    var description: String {
        return self.rawValue
    }
}

func run() -> String? {
    print("1 : \(Menu.open)\n2 : \(Menu.close)")
    print("입력 : ", terminator: "")
    guard let userInput: String = readLine() else {
        return nil
    }
    return userInput
}

func startTask(_ userInput: String?) {
    while userInput == "1" {
        let newbankManager = [BankManager()]
        let bank = Bank(bankManager: newbankManager)
        
        bank.openBank()
        
        run()
    }
}

startTask(run())
