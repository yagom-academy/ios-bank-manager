//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/29.
//

import Foundation

class Client {
    // MARK:- Properties
    let task: TaskCategory
    private var queueTicket: UInt?
    
    // MARK:- initializer
    init(task: TaskCategory) {
        self.task = task
    }
    
    // MARK:- internal Methods
    func setQueueTicket(queueTicket: UInt) {
        self.queueTicket = queueTicket
    }
    
    func submitQueueTicket() -> UInt? {
        return queueTicket
    }
}
