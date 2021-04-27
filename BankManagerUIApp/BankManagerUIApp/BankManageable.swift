//
//  FrontServicable.swift
//  BankManagerUIApp
//
//  Created by James on 2021/04/27.
//

import Foundation

protocol BankManageable {
    func manageWaitingLine(numberOfTellers: Int) -> OperationQueue
    func acceptClient() -> Operation
}

extension BankManageable {
    func manageWaitingLine(numberOfTellers: Int) -> OperationQueue {
        let waitingQueue = OperationQueue()
        waitingQueue.maxConcurrentOperationCount = numberOfTellers
        return waitingQueue
    }
    
    func acceptClient() -> Operation {
        let client = Client()
        return client
    }
}
