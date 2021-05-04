//
//  Teller.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

struct BankManager {
    let numberOfManager: Int
    
    func handleTask(_ clients: [Client]) -> Double {
        var totalTaskTime: Double = 0
        var tasks: [Operation] = []
        let clientWaitingLineQueue = OperationQueue()
        
        clientWaitingLineQueue.maxConcurrentOperationCount = numberOfManager
        
        for client in clients {
            let task = client.getTask()
            
            tasks.append(task)
            totalTaskTime += task.getTaskTime()
        }
        
        clientWaitingLineQueue.addOperations(tasks, waitUntilFinished: true)
        
        return totalTaskTime
    }
}
