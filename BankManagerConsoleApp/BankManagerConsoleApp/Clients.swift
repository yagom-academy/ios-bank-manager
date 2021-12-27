//
//  Clients.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation

struct Client {
    let identifier: Int
    
    init(identifier: Int = 0) {
        self.identifier = identifier
    }
}

struct Clients {
    private var waitingLine = Queue<Client>()
    
    mutating func makeWaitingLine() -> Int {
        let totalClientCount = Int.random(in: 10...30)
        
        (1...totalClientCount).forEach { identifier in
            let client = Client(identifier: identifier)
            
            waitingLine.enqueue(client)
        }
        
        return totalClientCount
    }
    
    func startTask() -> Int {
        guard let client = waitingLine.peek() else {
            return Bank.emptyWaitingLine
        }
        
        return client.identifier
    }
    
    mutating func completeTask() {
        waitingLine.dequeue()
    }
}
