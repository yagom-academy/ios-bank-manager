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
        clients.append(Client(waitingNumber: waitingNumber))
    }
    return clients
}

private func main() {
    let bank = Bank()
    let tellerNumber = 3
    let maxClientNumber = 30
    let minClientNumber = 10
    var isContinue = true
    
    func initClients(_ number: Int) -> [Client] {
        var clients: [Client] = []

        for waitingNumber in 1...number {
            clients.append(Client(waitingNumber: waitingNumber))
        }
        return clients
    }
    
    while isContinue {
        Dashboard.printMenu()
        
        guard let input = readLine(), let command = Menu(rawValue: input) else {
            print(BankError.wrongInput.description)
            continue
        }
        
        switch command {
        case .start:
            let clients = initClients(randomNumber(from: minClientNumber, to: maxClientNumber))
            bank.operateBank(teller: tellerNumber, client: clients)
        case .end:
            isContinue = false
        }
    }
}

main()
