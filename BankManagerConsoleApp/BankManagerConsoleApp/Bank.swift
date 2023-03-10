//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

import Foundation

class Bank {
    private var banker: [Banker] = .init()
    private var clientQueue: Queue<BankClient> = .init()
    private var numberOfClient: Int = 0
    
    init() {
        banker.append(Banker())
    }
    
    func openBank() {
        setupClient()
        assignClientsToBankTeller()
        closeBank()
    }
    
    private func setupClient() {
        let numberOfWaitingClient = Int.random(in: 10...30)
        
        for number in 1...numberOfWaitingClient {
            clientQueue.enqueue(BankClient(waitingNumber: number))
        }
    }
    
    private func assignClientsToBankTeller() {
        while let client = clientQueue.dequeue() {
            guard let banker = banker.first else { return }
            banker.receive(client: client)
            numberOfClient += 1
        }
    }
    
    private func closeBank() {
        printClosingMessage()
        clearNumberOfClient()
    }
    
    private func printClosingMessage() {
        let totalWorkTime = numberOfClient.totalWorkTime(by: Banker.requiredTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
    
    private func clearNumberOfClient() {
        numberOfClient = 0
    }
}

fileprivate extension Int {
    func totalWorkTime(by workTime: Double) -> String {
        let totalWorkTime = Double(self) * workTime
        
        return String(format: "%0.2f", totalWorkTime)
    }
}
