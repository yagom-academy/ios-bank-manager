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
    private let depositQueue: OperationQueue = {
        let queue: OperationQueue = .init()
        queue.maxConcurrentOperationCount = 2
        
        return queue
    }()
    private let loanQueue: OperationQueue = {
        let queue: OperationQueue = .init()
        queue.maxConcurrentOperationCount = 1
        
        return queue
    }()

    func resetOperationQueue() {
        depositQueue.cancelAllOperations()
        loanQueue.cancelAllOperations()
    }
    
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
            let blockOperation = makeBlockOperation(client)
            depositQueue.addOperation(blockOperation)
        case .loan:
            let blockOperation = makeBlockOperation(client)
            loanQueue.addOperation(blockOperation)
        }
    }
    
    private func makeBlockOperation(_ client: BankClient) -> BlockOperation {
        let task = BlockOperation {
            NotificationCenter.default.post(name: NSNotification.Name("startBankBusiness"), object: client)
            Banker.receive(client: client)
            NotificationCenter.default.post(name: NSNotification.Name("endBankBusiness"), object: client)
        }
        
        return task
    }
    
    private func closeBank(processTime: Double) {
        let totalWorkTime = String(format: "%0.2f", processTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
    }
}
