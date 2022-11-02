//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

struct Bank {
    private let bankWorker: BankWorker
    private var clientQueue: ClientQueue<Client> = ClientQueue()
    private var bankManager: BankManager = BankManager()
    
    init(bankWorker: BankWorker) {
        self.bankWorker = bankWorker
    }
    
    mutating func openBank() {
        updateClientQueue()
        bankManager.startTimer()
        startBankWork()
        bankManager.stopTimer()
        closeBank()
    }
    
    mutating private func updateClientQueue() {
        for number in 1...Int.random(in: 10...30) {
            clientQueue.enqueue(Client(waitingTicket: number))
            bankManager.addClientCount()
        }
    }
    
    mutating private func startBankWork() {
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { return }
            bankWorker.startWork(client: client)
        }
    }
    
    mutating private func closeBank() {
        print("업무가 마감되었습니다. ", terminator: "")
        print("오늘 업무를 처리한 고객은 총 \(bankManager.bringClientCount())명이며, ", terminator: "")
        print("총 업무시간은 \(String(format: "%.2f", bankManager.bringTotalWorkTime()))초입니다.")
        
        bankManager.resetData()
    }
}
