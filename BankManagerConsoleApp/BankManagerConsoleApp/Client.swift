//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/29.
//

import Foundation

class Client {
    let tasks: [TaskCategory]
    var queueTicket: UInt?
    
    init(tasks: [TaskCategory] = [.defaultTask]) {
        self.tasks = tasks
    }
    
    func setQueueTicket(queueTicket: UInt) {
        self.queueTicket = queueTicket
    }
    
    func submitQueueTicket() -> UInt? {
        return queueTicket
    }
}
