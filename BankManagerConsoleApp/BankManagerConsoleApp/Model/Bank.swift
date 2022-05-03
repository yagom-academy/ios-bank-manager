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

struct Bank: Clerkalbe, Measurable {
    var clients: Queue<Client>
    private let group = DispatchGroup()
    
    init(clients: Queue<Client>) {
        self.clients = clients
    }
    
    func measureWorkingHours() -> Double {
        let duration = measureTime {
            work()
            group.wait()
        }
        return duration
    }
    
    private func work() {
        while let client = clients.dequeue() {
            work(client: client, group: group)
        }
    }
    
    func countClients() -> Int {
        return Int.random(in: ClientCount.minimum.rawValue...ClientCount.maximum.rawValue)
    }
    
    func giveWaitingNumber(for totalClients: Int) {
        for waitingNumber in ClientCount.first.rawValue...totalClients {
            clients.enqueue(data: Client(waitingNumber: waitingNumber, task: Task.random))
        }
    }
}
