//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

final class Bank {
    private var clerks: [Workable] = []
    private var loanClientQueue = Queue(list: LinkedList<Client>())
    private var depositClientQueue = Queue(list: LinkedList<Client>())
    private let operationQueue = OperationQueue()
    private(set) var loanClerksCount: Int
    private(set) var depositClerksCount: Int
    
    init(loanClerksCount: Int, depositClerksCount: Int) {
        self.loanClerksCount = loanClerksCount
        self.depositClerksCount = depositClerksCount
    }
    
    func assignByWork(_ loanClerksCount: Int, _ depositClerksCount: Int) {
        for _ in 0..<loanClerksCount {
            let loanClerk = BankClerk(workType: .loan, queue: loanClientQueue)
            clerks.append(loanClerk)
        }
        
        for _ in 0..<depositClerksCount {
            let depositClerk = BankClerk(workType: .deposit, queue: depositClientQueue)
            clerks.append(depositClerk)
        }
    }
    
    func executeBankWork() {
        receiveClients()
        let totalClientsCount = loanClientQueue.count + depositClientQueue.count
        let totalWorkTime = measureWorkTime {
            executeWork()
        }
        let resultDescription = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f입니다."
        let resultMessage = String(format: resultDescription, totalClientsCount, totalWorkTime)
        
        print(resultMessage)
        clerks.removeAll()
    }
    
    private func receiveClients() {
        for order in 1...Int.random(in: 10...30) {
            arrangeByWorkType(Client(order))
        }
    }
    
    private func arrangeByWorkType(_ client: Client) {
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
