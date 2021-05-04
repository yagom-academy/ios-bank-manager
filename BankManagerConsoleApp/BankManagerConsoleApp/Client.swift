//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/30.
//

import Foundation

struct Client {
    private let task: BankTaskOperation
    
    static func create() -> [Client] {
        var clients: [Client] = []
        
        for number in 1...Int.random(in: 10...30) {
            clients.append(Client(task: BankTaskOperation(number)))
        }
        
        return clients
    }
    
    func getTask() -> BankTaskOperation {
        return task
    }
}
