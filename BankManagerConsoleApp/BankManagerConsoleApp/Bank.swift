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
    
    private let businessQueue: DispatchQueue = .init(label: "bankerDispatchQueue", attributes: .concurrent)
    private let depositSemaphore: DispatchSemaphore = .init(value: 2)
    private let loanSemaphore: DispatchSemaphore = .init(value: 1)
    
    func open() {
        setupClient()
        let processTime = measureProcessTime(processBusiness)
        closeBank(processTime: processTime)
    }
    
    private func setupClient() {
        numberOfClient = 0
        let numberOfWaitingClient = Int.random(in: 10...30)
        
        for number in 1...numberOfWaitingClient {
            guard let businessType = BusinessType.allCases.randomElement() else { return }
            let client: BankClient = .init(waitingNumber: number, businessType: businessType)
            
            clientQueue.enqueue(client)
        }
    }
    
    private func measureProcessTime(_ process: () -> ()) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return processTime
    }
    
    private func processBusiness() {
        let businessDispatchGroup: DispatchGroup = .init()
                
        while let client = clientQueue.dequeue() {
            dispatchClient(client, dispatchGroup: businessDispatchGroup)
            numberOfClient += 1
        }
        
        businessDispatchGroup.wait()
    }
    
    private func dispatchClient(_ client: BankClient, dispatchGroup: DispatchGroup) {
        switch client.businessType {
        case .deposit:
            businessQueue.async(group: dispatchGroup) {
                self.depositSemaphore.wait()
                Banker.receive(client: client)
                self.depositSemaphore.signal()
            }
        case .loan:
            businessQueue.async(group: dispatchGroup) {
                self.loanSemaphore.wait()
                Banker.receive(client: client)
                self.loanSemaphore.signal()
            }
        }
    }
    
    private func closeBank(processTime: Double) {
        let totalWorkTime = String(format: "%0.2f", processTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
