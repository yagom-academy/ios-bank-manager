//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

struct Teller {
    let number: Int
    
    mutating func handleTask(_ clients: [Client]) -> Double {
        var totalTaskTime: Double = 0
        var tasks: [Operation] = []
        let clientWaitingLineQueue = OperationQueue()
        
        clientWaitingLineQueue.maxConcurrentOperationCount = number
        
        for client in clients {
            tasks.append(client.task)
            totalTaskTime += client.task.taskTime
        }
        
        clientWaitingLineQueue.addOperations(tasks, waitUntilFinished: true)
        
        return totalTaskTime
    }
}
