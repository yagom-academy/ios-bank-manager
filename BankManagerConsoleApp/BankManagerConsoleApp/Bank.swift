//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct Bank {
    private let clerk: Workable
    private var clientQueue = Queue(list: LinkedList<Client>())
    private var numberOfClients = 0
    
    init(with clerk: Workable) {
        self.clerk = clerk
    }
    
    mutating func executeBankWork() {
        let start = CFAbsoluteTimeGetCurrent()

        receiveClients()
        DispatchQueue.global().sync {
            serveClients()
        }
        
        let interval = CFAbsoluteTimeGetCurrent() - start
        let totalTime = String(format: "%.2f", interval)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients)명이며, 총 업무시간은 \(totalTime)입니다.")
    }
    
    private mutating func receiveClients() {
        for order in 1...Int.random(in: 10...30) {
            clientQueue.enqueue(Client(order))
        }
        numberOfClients = clientQueue.count
    }
    
    private mutating func serveClients() {
        while !clientQueue.isEmpty {
            let client = clientQueue.dequeue()
            clerk.deal(with: client)
        }
    }
}
