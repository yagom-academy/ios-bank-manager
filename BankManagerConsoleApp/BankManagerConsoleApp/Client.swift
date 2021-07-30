//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/29.
//

import Foundation

class Client {
    // MARK:- Properties
    let tasks: [TaskCategory]
    private var queueTicket: UInt?
    
    // MARK:- initializer
    init(tasks: [TaskCategory] = [.defaultTask]) {
        self.tasks = tasks
    }
    
    // MARK:- internal Methods
    func setQueueTicket(queueTicket: UInt) {
        self.queueTicket = queueTicket
    }
    
    func submitQueueTicket() -> UInt? {
        return queueTicket
    }
}
