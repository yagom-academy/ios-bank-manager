//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let taskGroup = DispatchGroup()
    private let queueSemaphore = DispatchSemaphore(value: 1)
    
    private var totalVisitedClients: Int = 0
}

private extension BankManager {
    func processRequest(from client: Client) {
        Thread.sleep(forTimeInterval: client.request.processingTime)
    }
    
    func startTask(for client: Client) {
        print("\(client.waitingNumber)번 고객 \(client.request.koreanTitle)업무 시작")
    }
    
    mutating func finishTask(for client: Client) {
        self.totalVisitedClients += 1
        print("\(client.waitingNumber)번 고객 \(client.request.koreanTitle)업무 완료")
    }
}

extension BankManager {
    mutating func processTask(from queue: ClientQueue<Client>) {
        while !queue.isEmpty() {
            self.queueSemaphore.wait()
            
            guard let client = queue.dequeue() else {
                return
            }
            
            self.startTask(for: client)
            
            self.queueSemaphore.signal()
            
            self.processRequest(from: client)
            
            self.finishTask(for: client)
        }
    }
    
    func retrieveTotalVisitedClients() -> Int {
        return totalVisitedClients
    }
    
    mutating func clearTotalVisitedClientsRecord() {
        self.totalVisitedClients = 0
    }
}
