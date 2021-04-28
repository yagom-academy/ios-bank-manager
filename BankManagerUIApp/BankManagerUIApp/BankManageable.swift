//
//  FrontServicable.swift
//  BankManagerUIApp
//
//  Created by James on 2021/04/27.
//

import Foundation

protocol BankManageable {
    func manageWaitingLine() -> OperationQueue
    func acceptClient() -> Operation
}

extension BankManageable {
    func manageWaitingLine() -> OperationQueue {
        let waitingQueue = OperationQueue()
        return waitingQueue
    }
    
    func acceptClient() -> Operation {
        let client = Client()
        return client
    }
}
