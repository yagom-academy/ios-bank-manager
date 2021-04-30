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
}
