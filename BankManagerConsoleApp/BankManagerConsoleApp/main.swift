//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func main() {
    let tellerNumber = 1
    var `continue` = true
    var clientNumber: Int {
        return Int.random(in: 10...30)
    }
    
    while `continue` {
        BankManager.shared.printMenu()
        
        guard let input = readLine() else {
            print(BankError.wrongInput.description)
            continue
        }
        
        switch input {
        case BankMenu.start.rawValue:
            BankManager.shared.operateBank(teller: tellerNumber, client: clientNumber)
        case BankMenu.end.rawValue:
            `continue` = false
        default:
            print(BankError.wrongInput.description)
        }
    }
}

main()
