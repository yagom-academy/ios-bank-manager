//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
//

import Foundation

private enum ClientCount: Int {
    case minimum = 10
    case maximum = 30
    case first = 1
}

struct Bank: Measurable {
    private var clients: Queue<Client>
    private let workGroup = DispatchGroup()
    
    private var totalClients: Int {
        return Int.random(in: ClientCount.minimum.rawValue...ClientCount.maximum.rawValue)
    }
    
    init(clients: Queue<Client>) {
        self.clients = clients
    }
    
    func measureWorkingHours() -> Double {
        let duration = measureTime {
            open()
            workGroup.wait()
        }
        return duration
    }
    
    private func open() {
        while let client = clients.dequeue() {
            DispatchQueue.global().async(group: workGroup) {
                BankClerk.work(client: client, group: workGroup)
            }
        }
    }
    
    func giveWaitingNumber() -> Int? {
        let totalClients = totalClients
        for waitingNumber in ClientCount.first.rawValue...totalClients {
            guard let task = Task.random else {
                return nil
            }
            clients.enqueue(data: Client(waitingNumber: waitingNumber, task: task))
        }
        return totalClients
    }
}
