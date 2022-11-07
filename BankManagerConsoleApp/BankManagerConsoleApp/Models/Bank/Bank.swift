//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

struct Bank<Queue: ClientQueueable> {
    private let banker: Banker
    private var clientQueue: Queue
    private var bankManager: BankManager = BankManager()
    
    init(banker: Banker, queue: Queue) {
        self.banker = banker
        self.clientQueue = queue
    }
    
    mutating func openBank() {
        updateClientQueue()
        startBankWork()
        endBankWork()
    }
    
    mutating private func updateClientQueue() {
        for number in 1...Int.random(in: 10...30) {
            guard let randomWork = Client.Purpose.allCases.randomElement() else { return }
            let client = Client(waitingTicket: number, purpose: randomWork)
            clientQueue.enqueue(client)
            bankManager.addClientCount()
        }
    }
    
    mutating private func startBankWork() {
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }
            bankManager.resetWorkTime()
            banker.startWork(client: client)
            bankManager.addWorkTime()
        }
    }
    
    mutating private func endBankWork() {
        bankManager.printWorkFinished()
    }
}
