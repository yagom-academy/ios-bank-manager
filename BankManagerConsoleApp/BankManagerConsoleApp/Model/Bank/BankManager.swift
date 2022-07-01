//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let taskGroup = DispatchGroup()
    
    func processRequest(from client: Client) {
        let processingTime = client.request.processingTime
        
        taskGroup.enter()
        startTask(for: client)
        DispatchQueue.global().asyncAfter(deadline: .now() + processingTime) {
            finishTask(for: client)
            taskGroup.leave()
        }
        
        taskGroup.wait()
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

