//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func main() {
    let bank = Bank()
    let tellerNumber = 3
    let maxClientNumber = 30
    let minClientNumber = 10
    var isContinue = true
    
    while isContinue {
        Dashboard.printMenu()
        
        guard let input = readLine(), let command = Menu(rawValue: input) else {
            print(BankError.wrongInput.description)
            continue
        }
        
        switch command {
        case .start:
            let randomNumber = Int.random(in: minClientNumber...maxClientNumber)
            let clients = Clients.init(number: randomNumber)
            bank.operateBank(teller: tellerNumber, client: clients.list)
        case .end:
            isContinue = false
        }
    }
}

main()
