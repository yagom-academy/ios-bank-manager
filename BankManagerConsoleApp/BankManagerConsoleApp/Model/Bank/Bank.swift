//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick kim on 2022/07/01.
//

import Foundation

struct Bank {
    private let manager = BankManager()
    private(set) var clientQueue = ClientQueue<Client>()
    
    private var totalProcessingTime: Double = 0.0
    private var totalVisitedClients: Int = 0
}

extension Bank {
    mutating func open() {
        generateClients()
        
        while !clientQueue.isEmpty() {
            assignTask(to: manager)
        }
        
        reportSummary()
    }
    
    mutating func close() {
        totalProcessingTime = 0.0
        totalVisitedClients = 0
    }
}

private extension Bank {
    mutating func generateClients() {
        let clientAmount = Int.random(in: 10...30)
        let task: Request = .task
        
        for amount in 1...clientAmount {
            clientQueue.enqueue(Client(request: task, waitingNumber: amount))
        }
    }
    
    mutating func assignTask(to bankManager: BankManager) {
        guard let client = clientQueue.dequeue() else {
            return
        }
        
        bankManager.processRequest(from: client)
        
        totalProcessingTime += client.request.processingTime
        totalVisitedClients += 1
    }
    
    func reportSummary() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalVisitedClients)명이며, 총 업무시간은 \(totalProcessingTime.roundDown())초입니다.")
    }
}
