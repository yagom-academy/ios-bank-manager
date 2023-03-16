//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

import Foundation

final class Bank {
    private var clientQueue: Queue<BankClient> = .init()
    private var numberOfClient: Int = 1
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
    }
    
    func makeClient() -> BankClient? {
        guard let business = Business.allCases.randomElement() else { return nil }
        
        let client: BankClient = .init(waitingNumber: numberOfClient, business: business)
        
        clientQueue.enqueue(client)
        numberOfClient += 1
        
        return client
    }
    
    func processBusiness() {
        while let client = clientQueue.dequeue() {
            addClientToOperationQueue(client)
        }
    }
    
    func addClientToOperationQueue(_ client: BankClient) {
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
