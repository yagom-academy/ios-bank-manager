//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Decision: String {
    case excute = "1"
    case exit = "2"
}

func displayMenu() {
    print("1 : 은행개점\n2 : 종료")
    print("입력 : ", terminator: "")
}

func decideToStartProgram() -> Bool {
    while true {
        displayMenu()
        if let unwrappedString = readLine(),
           let decision = Decision.init(rawValue: unwrappedString) {
            return decision == .excute
        }
    }
}


// MARK: --- main Program
let yagomBank = BankManager()
while true {
    guard decideToStartProgram() else { break }
    yagomBank.lineupClients()
    yagomBank.open()
    yagomBank.close()
}
