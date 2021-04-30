//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yun, Ryan on 2021/04/27.
//

import Foundation

struct Bank {
    // MARK: - Properties
    private var waitingQueue: OperationQueue = OperationQueue()
    
    init(numberOfTeller: Int = 1) {
        self.waitingQueue.maxConcurrentOperationCount = numberOfTeller
    }
    
    // MARK: - NameSpaces
    private enum NumberOfClient {
        static let minimum: Int = 10
        static let maximum: Int = 30
    }
    
    // MARK: - Private Methods
    mutating func open() {
        let clients: [Client] = makeClients(
            number: Int.random(in: NumberOfClient.minimum...NumberOfClient.maximum)
        )
        let totalProcessTime: Double = measureTime { processTasks(of: clients) }
        
        close(numberOfClient: clients.count, totalProcessTime)
    }
    
    mutating func makeClients(number: Int) -> [Client] {
        var clients: [Client] = []
        
        guard number >= 1 else { return clients }
        
        for waitingNumber in 1...number {
            clients.append(Client(waitingNumber))
        }
        
        return clients
    }
    
    func measureTime(_ subjectMethodsToBeMeasured: () -> Void) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        subjectMethodsToBeMeasured()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        return floor(processTime * 100) / 100
    }
    
    mutating func processTasks(of clients: [Client]) {
        waitingQueue.addOperations(clients, waitUntilFinished: true)
    }
    
    func close(numberOfClient: Int, _ totalProcessTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient) 명이며, 총 업무 시간은 \(totalProcessTime)초입니다.")
    }
}

