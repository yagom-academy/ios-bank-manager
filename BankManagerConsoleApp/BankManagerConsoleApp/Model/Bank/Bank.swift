//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick kim on 2022/07/01.
//

import Foundation

struct Bank {
    private let manager = BankManager()
    private(set) var clientQueue = ClientQueue<Client>()
    
    private var totalProcessingTime: Double = 0.0
    private var totalVisitedClients = 0
}

extension Bank {
    mutating func open() {
        generateClients()
    }
}

private extension Bank {
    mutating func generateClients() {
        let clientAmount = Int.random(in: 10...30)
        let task: Request = .task
        
        for amount in 1...clientAmount {
            clientQueue.enqueue(Client(request: task, waitingNumber: amount))
        }
    }
}
