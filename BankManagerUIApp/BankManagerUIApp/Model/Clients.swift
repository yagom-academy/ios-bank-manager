//
//  Clients.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation

private struct Client {
    let identifier: Int
    let taskType: Bank.Task
}

class Clients {
    private var waitingLine = Queue<Client>()
    
    func makeWaitingLine() -> Int {
        let totalClientCount = Int.random(in: 10...30)
        
        (1...totalClientCount).forEach { identifier in
            let randomTask = Bank.Task.allCases.randomElement()
            
            guard let taskType = randomTask else {
                return
            }
            
            let client = Client(identifier: identifier, taskType: taskType)
            
            waitingLine.enqueue(client)
        }
        
        return totalClientCount
    }
    
    func takeTurn() -> Int? {
        let recentClient = waitingLine.dequeue()
        let clientIdentifier = recentClient?.identifier
        
        return clientIdentifier
    }
    
    func informTaskType() -> Bank.Task? {
        let recentClient = waitingLine.peek()
        let clientTaskType = recentClient?.taskType
        
        return clientTaskType
    }
}
