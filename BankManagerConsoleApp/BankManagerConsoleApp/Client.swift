//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

struct Client {
    let waitingNumber: Int
    let taskTime: Double
    let task: BankTaskOperation
    
    init(waitingNumber: Int, taskTime: Double) {
        self.waitingNumber = waitingNumber
        self.taskTime = taskTime
        self.task = BankTaskOperation(waitingNumber, taskTime)
    }
    
    static func create() -> [Client] {
        var clients: [Client] = []
        
        for number in 1...Int.random(in: 10...30) {
            clients.append(Client(waitingNumber: number, taskTime: 0.7))
        }
        
        return clients
    }
}
