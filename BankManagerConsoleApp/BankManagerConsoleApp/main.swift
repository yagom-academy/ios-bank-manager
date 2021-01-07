//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private func main() {
    let bank = Bank()
    let tellerNumber = 2
    var isContinue = true
    var clientNumber: Int {
        return Int.random(in: 10...30)
    }
    
    while isContinue {
        bank.printMenu()
        
        guard let input = readLine(), let command = BankMenu(rawValue: input) else {
            print(BankError.wrongInput.description)
            continue
        }
        
        switch command {
        case .start:
            bank.operateBank(teller: tellerNumber, client: clientNumber)
        case .end:
            isContinue = false
        }
    }
}

main()
