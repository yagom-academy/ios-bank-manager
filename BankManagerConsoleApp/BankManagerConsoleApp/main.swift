//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private func main() {
    let bank = Bank()
    let tellerNumber = 1
    var isContinue = true
    var randomNumber: Int {
        return Int.random(in: 10...30)
    }
    
    func initClients(_ number: Int) -> [Client] {
        var clients: [Client] = []

        for waitingNumber in 1...number {
            clients.append(Client(waitingNumber: waitingNumber))
        }
        return clients
    }
    
    while isContinue {
        bank.printMenu()
        
        guard let input = readLine(), let command = BankMenu(rawValue: input) else {
            print(BankError.wrongInput.description)
            continue
        }
        
        switch command {
        case .start:
            let clients = initClients(randomNumber)
            bank.operateBank(teller: tellerNumber, client: clients)
        case .end:
            isContinue = false
        }
    }
}

main()
