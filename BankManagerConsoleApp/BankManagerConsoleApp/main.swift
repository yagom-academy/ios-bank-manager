//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private func randomNumber(from minNumber: Int = 0, to maxNumber: Int) -> Int {
    return Int.random(in: minNumber...maxNumber)
}

private func initClients(_ number: Int) -> [Client]? {
    var clients: [Client] = []
    
    for waitingNumber in 1...number {
        guard let businessType = BusinessType(rawValue: randomNumber(to: BusinessType.allCases.count - 1)), let priority = Client.Priority(rawValue: randomNumber(to: Client.Priority.allCases.count - 1)) else {
            return nil
        }
        
        clients.append(Client(waitingNumber: waitingNumber, businessType: businessType, priority: priority))
    }
    return clients
}

private func main() {
    let bank = Bank()
    let tellerNumber = 3
    let maxClientNumber = 30
    let minClientNumber = 10
    var isContinue = true
    
    while isContinue {
        bank.printMenu()
        
        guard let input = readLine(), let command = BankMenu(rawValue: input) else {
            print(BankError.wrongInput.description)
            continue
        }
        
        switch command {
        case .start:
            guard let clients = initClients(randomNumber(from: minClientNumber, to: maxClientNumber)) else {
                return 
            }
            bank.operateBank(teller: tellerNumber, client: clients)
        case .end:
            isContinue = false
        }
    }
}

main()
