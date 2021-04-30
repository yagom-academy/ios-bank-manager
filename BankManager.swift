//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum ClientType: Int, CaseIterable {
    case vvip = 0
    case vip = 1
    case normal = 2
}

class BankManager {
    let counter = OperationQueue()
    var numberOfClients = [Client]()
    var numberOfTeller: Int
    
    init(numberOfTeller: Int) {
        self.numberOfTeller = numberOfTeller
    }
    
    func generateNumberOfClient() {
        let generateRandomClientNumber = Int.random(in: 10...30)
        
        for number in 1...generateRandomClientNumber {
            guard let clientCase = ClientType.allCases.randomElement() else {
                return
            }
            let client = Client(waitNumber: number, clientType: clientCase)
            numberOfClients.append(client)
        }
        print(numberOfClients)
        numberOfClients.removeAll()
    }
    
    func workTask() {
        
    }
    
    func sendToCounter() {
        counter.maxConcurrentOperationCount = numberOfTeller
    }
    
    func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients.count)명이며, 총 업무시간은 \(Double(numberOfClients.count) * 0.7)초입니다.")
    }
}

struct Client {
    let waitNumber: Int
    let clientType: ClientType
}
