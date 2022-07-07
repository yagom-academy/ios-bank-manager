//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let name: String
    let task: Request
    
    private let taskGroup = DispatchGroup()
    
    func processRequest(from client: Client) {
//        let processingTime = client.request.processingTime
        
//        startTask(for: client)
        Thread.sleep(forTimeInterval: client.request.processingTime)
    }
    
    func startTask(for client: Client) {
        print("\(self.name): \(client.waitingNumber)번 고객 \(client.request.koreanTitle)업무 시작")
    }
    
    func finishTask(for client: Client) {
        print("\(self.name): \(client.waitingNumber)번 고객 \(client.request.koreanTitle)업무 완료")
    }
}
