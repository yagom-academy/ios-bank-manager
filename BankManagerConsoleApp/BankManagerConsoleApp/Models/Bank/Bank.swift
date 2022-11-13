//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

import Foundation

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
        let client = Client(waitingTicket: bankManager.clientCount + 1, purpose: randomPurpose)
        clientQueue.enqueue(client)
        bankManager.addClientCount()
        return client
    }
    
    func startBankWork() {
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }
            
            divideWork(client: client)
        }
    }
    
    private func divideWork(client: Client) {
        switch client.purpose {
        case .deposit:
            depositQueue.addOperation { [weak self] in
                NotificationCenter.default.post(name: .client,
                                                object: client,
                                                userInfo: ["WorkState" : WorkState.start])
                self?.banker.startWork(client: client)
                NotificationCenter.default.post(name: .client,
                                                object: client,
                                                userInfo: ["WorkState" : WorkState.done])
            }
            
        case .loan:
            loanQueue.addOperation { [weak self] in
                NotificationCenter.default.post(name: .client,
                                                object: client,
                                                userInfo: ["WorkState" : WorkState.start])
                self?.banker.startWork(client: client)
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
