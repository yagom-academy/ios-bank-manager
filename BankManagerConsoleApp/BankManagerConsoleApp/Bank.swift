//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct Bank {
    private var clerks: [Workable] = []
    private var loanClientQueue = Queue(list: LinkedList<Client>())
    private var depositClientQueue = Queue(list: LinkedList<Client>())
    private let operationQueue = OperationQueue()
    
    mutating func executeBankWork() {
        let numberOfClients = receiveClients()
        let totalWorkTime = measureWorkTime {
            serveClients()
        }
        let resultDescription = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f입니다."
        let resultMessage = String(format: resultDescription, numberOfClients, totalWorkTime)
        
        print(resultMessage)
    }
    
    @discardableResult
    private mutating func receiveClients() -> Int {
        for order in 1...Int.random(in: 10...30) {
            clientQueue.enqueue(Client(order))
    
    private mutating func arrangeByWorkType(_ client: Client) {
        switch client.requirementType {
        case .loan:
            loanClientQueue.enqueue(client)
        case .deposit:
            depositClientQueue.enqueue(client)
        }
    }
    
    private func measureWorkTime(_ block: () -> Void) -> Double {
        let start = CFAbsoluteTimeGetCurrent()
        block()
        let interval = CFAbsoluteTimeGetCurrent() - start
        return interval
    }
    
    private func executeWork() {
        operationQueue.maxConcurrentOperationCount = clerks.count
        operationQueue.addOperations(clerks, waitUntilFinished: true)
    }
}
