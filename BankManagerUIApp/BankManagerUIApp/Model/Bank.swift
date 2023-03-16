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

    func open() {
        addNotificationObserver()
    }
    
    private func addNotificationObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(allClear),
            name: Notification.Name("touchUpResetButton"),
            object: nil
        )
    }
    
    @objc private func allClear() {
        clearClient()
        cancelOperationQueue()
    }
    
    private func clearClient() {
        clientQueue.clear()
        numberOfClient = 1
    }
    
    private func cancelOperationQueue() {
        depositQueue.cancelAllOperations()
        loanQueue.cancelAllOperations()
    }
    
    func makeClient() -> BankClient? {
        guard let business = Business.allCases.randomElement() else { return nil }
        
        let client: BankClient = .init(waitingNumber: numberOfClient, business: business)
        
        clientQueue.enqueue(client)
        numberOfClient += 1
        
        return client
    }
    
    var loanCompleted = false
    var depositCompleted = false
    
    func processBusiness() {
        while let client = clientQueue.dequeue() {
            addClientToOperationQueue(client)
        }
        
        let completionBlock = BlockOperation()
        completionBlock.completionBlock = {
            self.loanCompleted = true
        }
        let completionBlock2 = BlockOperation()
        completionBlock.completionBlock = {
            self.depositCompleted = true
        }
        
        loanQueue.addOperation(completionBlock)
        depositQueue.addOperation(completionBlock2)
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
            Thread.sleep(forTimeInterval: client.business.time)
            NotificationCenter.default.post(name: NSNotification.Name("endBankBusiness"), object: client)
        }
        
        return task
    }
}
