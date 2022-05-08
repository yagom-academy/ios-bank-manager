//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
//

import Foundation

fileprivate enum ClientCount: Int {
    case minimum = 10
    case maximum = 30
    case first = 1
}

struct Bank: Measurable {
    private var clients = Queue<Client>()
    private let workGroup = DispatchGroup()
    private var lastClientsNumber = 0
    
    private var totalClientsCount: Int {
        return Int.random(in: ClientCount.minimum.rawValue...ClientCount.maximum.rawValue)
    }
    
    func measureWorkingHours() -> Double {
        let duration = measureTime {
            open()
        }
        return duration
    }
    
    private func open() {
        while let client = clients.dequeue() {
            DispatchQueue.global().async(group: workGroup) {
                BankClerk.work(client: client, group: workGroup)
            }
        }
        workGroup.wait()
    }
    
    func giveWaitingNumber() -> Int? {
        let totalClients = totalClientsCount
        for waitingNumber in ClientCount.first.rawValue...totalClients {
            guard let task = Task.random else {
                return nil
            }
            clients.enqueue(data: Client(waitingNumber: waitingNumber, task: task))
        }
        return totalClients
    }
}
