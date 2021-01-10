//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private func main() {
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
            guard let clients = initClients(randomNumber(from: minClientNumber, to: maxClientNumber)) else {
                return 
            }
            bank.operateBank(teller: tellerNumber, client: clients)
        case .end:
            isContinue = false
        }
    }
}

private func randomNumber(from minNumber: Int = 0, to maxNumber: Int) -> Int {
    return Int.random(in: minNumber...maxNumber)
}

private func initClients(_ number: Int) -> [Client]? {
    var clients: [Client] = []
    
    for waitingNumber in 1...number {
        guard let businessType = BusinessType.allCases.randomElement(), let priority = Client.Priority.allCases.randomElement() else {
            return nil
        }
        
        clients.append(Client(waitingNumber: waitingNumber, businessType: businessType, priority: priority))
    }
    return clients
}

main()
