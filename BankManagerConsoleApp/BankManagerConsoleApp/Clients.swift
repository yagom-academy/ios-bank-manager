//
//  Clients.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation

struct Client {
    let identifier: Int
    let taskType: Bank.Task
}

struct Clients {
    private var waitingLine = Queue<Client>()
    
    mutating func makeWaitingLine() -> Int {
        let totalClientCount = Int.random(in: 10...30)
        
        (1...totalClientCount).forEach { identifier in
            guard let taskType = Bank.Task.allCases.randomElement() else {
                return
            }
            
            let client = Client(identifier: identifier, taskType: taskType)
            
            waitingLine.enqueue(client)
        }
        
        return totalClientCount
    }
    
    mutating func startTask() -> Int? {
        guard let client = waitingLine.dequeue() else {
            return nil
        }
        
        return client.identifier
    }
    
    func informTaskType() -> Bank.Task? {
        guard let client = waitingLine.peek() else {
            return nil
        }
        
        return client.taskType
    }
    
    mutating func completeTask() {
        waitingLine.dequeue()
    }
}
