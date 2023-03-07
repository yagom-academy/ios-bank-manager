//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//
import Foundation

struct Bank {
    var bankTeller = [BankTeller]()
    var clientQueue = Queue<BankClient>()
    var numberOfClient: Int = 0
    
    init() {
        bankTeller.append(BankTeller())
    }
    
    mutating func openBank() {
        setupClient()
        
        while let cilent = clientQueue.dequeue() {
            bankTeller[0].receiveClient(bankClient: cilent)
            numberOfClient += 1
        }
        
        printCloseMessage()
    }
    
    func printClosingMessage() {
        let numberFormmater = NumberFormatter()
        numberFormmater.numberStyle = .decimal
        numberFormmater.maximumFractionDigits = 2
        numberFormmater.minimumFractionDigits = 2
        
        guard let workTime = numberFormmater.string(for: Double(numberOfClient) * 0.7) else { return }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(workTime)초입니다.")
    }
    
    mutating func setupClient() {
        let numberOfWaitingClient = Int.random(in: 5...10)
        
        for number in 1...numberOfWaitingClient {
            clientQueue.enqueue(BankClient(waitingNumber: number))
        }
    }
}
