//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Zion, Whales on 2023/07/12.
//

import Foundation

final class Bank {
    private let depositBankManagerCount: Int
    private let loanBankManagerCount: Int
    private var clientQueue = Queue<Client>()
    private let bankManger = BankManager()
    
    init(depositBankManagerCount: Int, loanBankManagerCount: Int) {
        self.depositBankManagerCount = depositBankManagerCount
        self.loanBankManagerCount = loanBankManagerCount
    }
    
    func open() {
        print("1 : 은행개점\n2 : 종료\n입력", terminator: " : ")
        let input = readLine()
        
        switch input {
        case "1":
            startTask()
        default:
            return
        }
    }
    
    private func startTask() {
        let clientCount = Int.random(in: 10...30)
        let startTime = Date()
        let depositOperationQueue = OperationQueue()
        let loanOperationQueue = OperationQueue()
        var operationQueue: OperationQueue
        var operation: BlockOperation
        
        depositOperationQueue.maxConcurrentOperationCount = depositBankManagerCount
        loanOperationQueue.maxConcurrentOperationCount = loanBankManagerCount
        setUpClientQueue(count: clientCount)
        
        while !clientQueue.isEmpty {
            guard let client = clientQueue.dequeue() else { break }
            
            operation = BlockOperation { self.bankManger.work(client: client) }
            operationQueue = client.banking == .deposit ? depositOperationQueue : loanOperationQueue
            operationQueue.addOperation(operation)
        }
        
        depositOperationQueue.waitUntilAllOperationsAreFinished()
        loanOperationQueue.waitUntilAllOperationsAreFinished()
        printTaskResult(clientCount, startTime)
        open()
    }
    
    private func printTaskResult(_ clientCount: Int, _ startTime: Date) {
        let totalWorkTime = Date().timeIntervalSince(startTime)
        let formattedWorkTime = String(format: "%.2f", totalWorkTime)
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, 총 업무시간은 \(formattedWorkTime)초입니다.")
    }
    
    private func setUpClientQueue(count: Int) {
        var client: Client
        var bankingType: BankingType
        
        for turn in 1...count {
            bankingType = BankingType.allCases.randomElement() ?? .deposit
            client = Client(turn, bankingType)
            clientQueue.enqueue(client)
        }
    }
}
