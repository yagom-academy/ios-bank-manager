//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let taskGroup = DispatchGroup()
    
    func processRequest(from client: Client) {
//        let processingTime = client.request.processingTime
        
//        startTask(for: client)
        
    }
}

private extension BankManager {
    func startTask(for client: Client) {
        print("\(client.waitingNumber)번 고객 업무 시작")
    }
    
    func finishTask(for client: Client) {
        print("\(client.waitingNumber)번 고객 업무 완료")
    }
}

