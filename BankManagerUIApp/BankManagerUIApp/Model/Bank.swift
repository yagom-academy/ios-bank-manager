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
    
    func makeClient() -> BankClient? {
        guard let business = Business.allCases.randomElement() else { return nil }
        
        let client: BankClient = .init(waitingNumber: numberOfClient, business: business)
        
        clientQueue.enqueue(client)
        numberOfClient += 1
        
        return client
    }
    
    private func setupClient() {
        numberOfClient = 0
        let numberOfWaitingClient = Int.random(in: 10...30)
        
        for number in 1...numberOfWaitingClient {
            guard let business = Business.allCases.randomElement() else { return }
            let client: BankClient = .init(waitingNumber: number, business: business)
            
            clientQueue.enqueue(client)
        }
    }
    
    private func measureProcessTime(_ process: () -> ()) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return processTime
    }
    
    func processBusiness() {
        let businessDispatchGroup: DispatchGroup = .init()
        
        while let client = clientQueue.dequeue() {
            dispatchClient(client, dispatchGroup: businessDispatchGroup)
            numberOfClient += 1
        }
        
        //        businessDispatchGroup.wait()
    }
    
    func dispatchClient(_ client: BankClient, dispatchGroup: DispatchGroup) {
        switch client.business {
        case .deposit:
            let workItem: DispatchWorkItem = .init(qos: .background) {
                self.depositSemaphore.wait()
                NotificationCenter.default.post(name: NSNotification.Name("1"), object: client)
                Banker.receive(client: client)
                self.depositSemaphore.signal()
                NotificationCenter.default.post(name: NSNotification.Name("2"), object: client)
            }
            
            businessQueue.async(group: dispatchGroup, execute: workItem)
        case .loan:
            let workItem: DispatchWorkItem = .init(qos: .background) {
                self.loanSemaphore.wait()
                NotificationCenter.default.post(name: NSNotification.Name("1"), object: client)
                Banker.receive(client: client)
                self.loanSemaphore.signal()
                NotificationCenter.default.post(name: NSNotification.Name("2"), object: client)
            }
            
            businessQueue.async(group: dispatchGroup, execute: workItem)
        }
    }
    
    private func makeWorkItem(_ client: BankClient, dispatchGroup: DispatchGroup, semaphore: DispatchSemaphore) -> DispatchWorkItem {
        let task = DispatchWorkItem {
            semaphore.wait()
            NotificationCenter.default.post(name: NSNotification.Name("1"), object: client)
            Banker.receive(client: client)
            semaphore.signal()
            NotificationCenter.default.post(name: NSNotification.Name("2"), object: client)
        }
        
        return task
    }
    
    private func closeBank(processTime: Double) {
        let totalWorkTime = String(format: "%0.2f", processTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
