//
//  Clients.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation

struct Client {
    let clientNumber: Int
    
    init(_ clientNumber: Int = 0) {
        self.clientNumber = clientNumber
    }
}

struct Clients {
    private var waitingLine = Queue<Client>()
    
    mutating func makeWaitingLine() -> Int {
        let totalNumberOfClients = Int.random(in: 10...30)
        
        (1...totalNumberOfClients).forEach { clientNumber in
            let client = Client(clientNumber)
            
            waitingLine.enqueue(client)
        }
        
        return totalNumberOfClients
    }
    
    func startTask() -> Int {
        guard let client = waitingLine.peek() else {
            return Bank.emptyWaitingLine
        }
        
        return client.clientNumber
    }
    
    mutating func completeTask() {
        waitingLine.dequeue()
    }
}
