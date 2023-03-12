//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

import Foundation

final class Bank {
    private var clientQueue: Queue<BankClient> = .init()
    private var numberOfClient: Int = 0
    private var totalWorkTime: Double = 0
    
    private let dispatchQueue: DispatchQueue = .init(label: "bankerDispatchQueue", attributes: .concurrent)
    private let depositSemaphore: DispatchSemaphore = .init(value: 2)
    private let loanSemaphore: DispatchSemaphore = .init(value: 1)
    
    func openBank() {
        setupClient()
        processBusiness()
        closeBank()
    }
    
    private func setupClient() {
        let numberOfWaitingClient = Int.random(in: 5...10)
        
        for number in 1...numberOfWaitingClient {
            guard let businessType = BusinessType.allCases.randomElement() else { return }
            let client: BankClient = .init(waitingNumber: number, businessType: businessType)
            
            clientQueue.enqueue(client)
        }
    }
    
    private func processBusiness() {
        let businessDispatchGroup: DispatchGroup = .init()
        
        let startTime = CFAbsoluteTimeGetCurrent()
        
        while let client = clientQueue.dequeue() {
            dispatchClient(client, group: businessDispatchGroup)
            numberOfClient += 1
        }
        
        businessDispatchGroup.wait()
        
        totalWorkTime = CFAbsoluteTimeGetCurrent() - startTime
    }
    
    private func dispatchClient(_ client: BankClient, group: DispatchGroup) {
        switch client.businessType {
        case .deposit:
            dispatchQueue.async(group: group) {
                self.depositSemaphore.wait()
                Banker.receive(client: client)
                self.depositSemaphore.signal()
            }
        case .loan:
            dispatchQueue.async(group: group) {
                self.loanSemaphore.wait()
                Banker.receive(client: client)
                self.loanSemaphore.signal()
            }
        }
    }
    
    private func closeBank() {
        printClosingMessage()
        clearNumberOfClient()
    }
    
    private func printClosingMessage() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(String(format: "%0.2f", totalWorkTime))초입니다.")
    }
    
    private func clearNumberOfClient() {
        numberOfClient = 0
    }
}
