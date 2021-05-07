//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Yun, Ryan on 2021/04/27.
//

import Foundation

struct LocalBank {
    // MARK: - Properties
    private var waitingQueue: OperationQueue = OperationQueue()
    
    init(numberOfTeller: Int) {
        self.waitingQueue.maxConcurrentOperationCount = numberOfTeller
    }
    
    // MARK: - NameSpaces
    private enum NumberOfClient {
        static let minimum: Int = 10
        static let maximum: Int = 30
    }
    
    // MARK: - Private Methods
    mutating func open() {
        var clients: [Client] = makeClients(
            number: Int.random(in: NumberOfClient.minimum...NumberOfClient.maximum)
        )
        clients = sortByGrade(for: clients)
        
        let tasks: [BankingTask] = clients.map { client in
            return client.bankingTask
        }
        
        let totalProcessTime: Double = measureTime { () -> Void in
            return process(tasks)
        }
        
        let closeText: String = close(numberOfClient: clients.count, totalProcessTime)
        
        print(closeText)
    }
    
    mutating func makeClients(number: Int) -> [Client] {
        var clients: [Client] = []
        
        guard number >= 1 else {
            return clients
        }
        
        for waitingNumber in 1...number {
            let client: Client = Client(waitingNumber, grade: .random, task: .random)
            clients.append(client)
        }
        
        return clients
    }
    
    func sortByGrade(for clients: [Client]) -> [Client] {
        let sortedClients: [Client] =  clients.sorted(
            by: { (current: Client, next: Client) -> Bool in
            return current.grade < next.grade
        })
        return sortedClients
    }
    
    func measureTime(_ subjectMethodsToBeMeasured: () -> Void) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        subjectMethodsToBeMeasured()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        return processTime
    }
    
    func getPreferredNumberFormat(_ number: Double) -> Double {
        return floor(number * 100) / 100
    }
    
    mutating func process(_ tasks: [BankingTask]) {
        waitingQueue.addOperations(tasks, waitUntilFinished: true)
    }
    
    func close(numberOfClient: Int, _ totalProcessTime: Double) -> String {
        return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient) 명이며, 총 업무 시간은 \(getPreferredNumberFormat(totalProcessTime))초입니다."
    }
}

