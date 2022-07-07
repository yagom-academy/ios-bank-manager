//
//  ClientGenerator.swift
//  BankManagerConsoleApp
//
//  Created by Derrick kim on 2022/07/07.
//

import Foundation

struct ClientGenerator {
    func generateClients() -> (deposit: ClientQueue<Client>, loan: ClientQueue<Client>) {
        let clientAmount = Int.random(in: 10...30)
        
        var depositClientQueue = ClientQueue<Client>()
        var loanClientQueue = ClientQueue<Client>()
        
        for amount in 1...clientAmount {
            guard let requestName = Request.allCases.randomElement() else {
                return (ClientQueue<Client>(), ClientQueue<Client>())
            }
            
            switch requestName {
            case .deposit:
                depositClientQueue.enqueue(Client(request: requestName, waitingNumber: amount))
            case .loan:
                loanClientQueue.enqueue(Client(request: requestName, waitingNumber: amount))
            }
        }
        
        return (depositClientQueue, loanClientQueue)
    }
}
