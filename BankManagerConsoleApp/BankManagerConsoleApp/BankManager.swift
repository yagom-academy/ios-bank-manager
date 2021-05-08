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
        var tasks: [BankTaskOperation] = []
        let clientWaitingLineQueue = OperationQueue()
        
        clientWaitingLineQueue.maxConcurrentOperationCount = numberOfManager
        
        for client in clients {
            tasks.append(client.getTask())
        }
        
        clientWaitingLineQueue.addOperations(tasks, waitUntilFinished: true)
        
        return calculateTaskTime(tasks)
    }
    
    private func calculateTaskTime(_ tasks: [BankTaskOperation]) -> Double {
        var totalTaskTime: Double = 0
        
        for task in tasks {
            totalTaskTime += task.getTaskTime()
        }
        
        return totalTaskTime
    }
}
