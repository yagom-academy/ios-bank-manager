//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Ryan-Son on 2021/04/27.
//

import Foundation

struct Bank {
    var totalClient: Int = 0
    var waitingQueue: OperationQueue = OperationQueue()
    var numberOfTeller: Int
    var processedTime: Double = 0
    
    private enum NumberOfClient {
        static let minimum: Int = 10
        static let maximum: Int = 30
    }
    
    init(numberOfTeller: Int) {
        self.numberOfTeller = numberOfTeller
    }
    
    func totalProcessedTime(_ closure: () -> Void) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        closure()
        let processedTime = CFAbsoluteTimeGetCurrent() - startTime
        return processedTime
    }
    
    mutating func open() {
        assignTeller()
        processedTime = totalProcessedTime {
            visitNewClient()
        }
        close()
    }
    
    @discardableResult
    func close() -> Double {
        let totalProcessedTime = floor(processedTime * 100) / 100
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalClient) 명이며, 총 업무 시간은 \(totalProcessedTime)초입니다.")
        return totalProcessedTime
    }
    
    func assignTeller() {
        waitingQueue.maxConcurrentOperationCount = numberOfTeller
    }
    
    @discardableResult
    mutating func visitNewClient() -> [Client] {
        var clients: [Client] = []
        totalClient = Int.random(in: NumberOfClient.minimum...NumberOfClient.maximum)
        
        for waitingNumber in 1...totalClient {
            clients.append(Client(waitingNumber))
        }
        
        waitingQueue.addOperations(clients, waitUntilFinished: true)
        return clients
    }
}

