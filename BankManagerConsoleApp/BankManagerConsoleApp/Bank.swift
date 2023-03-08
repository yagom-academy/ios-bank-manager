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
        numberOfClient = 0
        
        while let client = clientQueue.dequeue() {
            bankTeller[0].receiveClient(bankClient: client)
            numberOfClient += 1
        }
    }
    
    private func printClosingMessage() {
        guard let totalClient = numberOfClient.numberFormat(),
              let totalWorkTime = (Double(numberOfClient) * BankTeller.requiredTime).numberFormat() else { return }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalClient)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
