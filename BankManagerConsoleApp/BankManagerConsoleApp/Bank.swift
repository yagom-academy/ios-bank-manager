//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

import Foundation

struct Bank {
    private var bankTeller = [BankTeller]()
    private var clientQueue = Queue<BankClient>()
    private var numberOfClient: Int = 0
    
    init() {
        bankTeller.append(BankTeller())
    }
    
    mutating func openBank() {
        setupClient()
        assignClientsToBankTeller()
        printClosingMessage()
    }
    
    private mutating func setupClient() {
        let numberOfWaitingClient = Int.random(in: 10...30)
        
        for number in 1...numberOfWaitingClient {
            clientQueue.enqueue(BankClient(waitingNumber: number))
        }
    }
    
    private mutating func assignClientsToBankTeller() {
        while let client = clientQueue.dequeue() {
            bankTeller[0].receiveClient(bankClient: client)
            numberOfClient += 1
        }
    }
    
    private func printClosingMessage() {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        
        guard let workTime = numberFormatter.string(for: Double(numberOfClient) * 0.7) else { return }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(workTime)초입니다.")
    }
}
