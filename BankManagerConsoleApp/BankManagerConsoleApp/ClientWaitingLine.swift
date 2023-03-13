//
//  ClientWaitingLine.swift
//  BankManagerConsoleApp
//
//  Created by Jinah Park on 2023/03/13.
//

class ClientWaitingLine {
    var clientCount = Int.zero
    
    func manageClientQueue() -> Queue<Client>  {
        var clientQueue = Queue<Client>()
        clientCount = Int.random(in: 1...5)
        
        for i in 1...clientCount {
            Client.Banking.allCases.randomElement().map {
                clientQueue.enqueue(Client(clientWaitingNumber: i, banking: $0))
            }
        }
        
        return clientQueue
    }
}
