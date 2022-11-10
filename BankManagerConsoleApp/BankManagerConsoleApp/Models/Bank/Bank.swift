//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

import Foundation

extension Notification.Name {
    static let client = Notification.Name("Client")
}

enum WorkState {
    case start
    case done
}

final class Bank<Queue: ClientQueueable> {
    private let depositQueue = OperationQueue()
    private let loanQueue = OperationQueue()
    private let banker: BankWorkable
    private var clientQueue: Queue
    private var bankManager: BankManagable
    
    init(banker: BankWorkable, queue: Queue, bankManager: BankManagable) {
        self.banker = banker
        self.clientQueue = queue
        self.bankManager = bankManager
        self.depositQueue.maxConcurrentOperationCount = 2
        self.loanQueue.maxConcurrentOperationCount = 1
    }
    
    func updateClientQueue() -> Client? {
        guard let randomPurpose = Client.Purpose.allCases.randomElement() else { return nil }
        let client = Client(waitingTicket: bankManager.checkCount() + 1, purpose: randomPurpose)
        clientQueue.enqueue(client)
        bankManager.addClientCount()
        return client
    }
    
    func startBankWork() {
        bankManager.resetWorkTime()
        
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }
            
            divideWork(client: client)
        }
        
        bankManager.addWorkTime()
    }
    
    private func divideWork(client: Client) {
        switch client.purpose {
        case .deposit:
            depositQueue.addOperation {
                NotificationCenter.default.post(name: .client,
                                                object: client,
                                                userInfo: ["WorkState" : WorkState.start])
                self.banker.startWork(client: client)
                NotificationCenter.default.post(name: .client,
                                                object: client,
                                                userInfo: ["WorkState" : WorkState.done])
            }
            
        case .loan:
            loanQueue.addOperation {
                NotificationCenter.default.post(name: .client,
                                                object: client,
                                                userInfo: ["WorkState" : WorkState.start])
                self.banker.startWork(client: client)
                NotificationCenter.default.post(name: .client,
                                                object: client,
                                                userInfo: ["WorkState" : WorkState.done])
            }
        }
    }
    
    func resetAll() {
        clientQueue.clear()
        bankManager.resetData()
        depositQueue.cancelAllOperations()
        loanQueue.cancelAllOperations()
    }
}
