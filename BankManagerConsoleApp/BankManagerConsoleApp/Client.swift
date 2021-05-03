//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

struct Client {
    let waitingNumber: Int
    let task: BankTaskOperation
    
    init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
        self.task = BankTaskOperation(waitingNumber)
    }
    
    static func create() -> [Client] {
        var clients: [Client] = []
        
        for number in 1...Int.random(in: 10...30) {
            clients.append(Client(waitingNumber: number))
        }
        
        return clients
    }
}
