//
//  ClientWaitingLine.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

class ClientWaitingLine {
    var clientCount = Int.zero
    
    func manageClientQueue() -> Queue<Client>  {
        var clientQueue = Queue<Client>()
        clientCount = Int.random(in: 10...30)
        
        for i in 1...clientCount {
            Client.Banking.allCases.randomElement().map {
                clientQueue.enqueue(Client(clientWaitingNumber: i, banking: $0))
            }
        }
        
        return clientQueue
    }
}
