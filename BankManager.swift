//
//  BankManager.swift
//  Created by kaki, songjun.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var numberOfClient = 0
    private var waitingQueue = Queue<Client>()
    
    mutating func setupWaitingQueueAndClientNumber() {
        let randomNumberOfClient = Int.random(in: 10...30)
        
        for number in 1...randomNumberOfClient {
            let client = Client(clientNumber: number,
                                requstedTask: .init(rawValue: Int.random(in: 1...2)) ?? .deposit)
            waitingQueue.enqueue(client)
        }
        
        numberOfClient = waitingQueue.size
    }
    
    mutating func processBusiness() {
        while !waitingQueue.isEmpty {
            guard let client = waitingQueue.dequeue() else { return }
            print("\(client.clientNumber)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: 0.7)
            print("\(client.clientNumber)번 고객 업무 완료")
        }
        
        presentBusinessResult()
    }
    
    private func presentBusinessResult() {
        let businessHours = Double(numberOfClient) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClient)명이며, 총 엄무시간은 \(String(format: "%.2f", businessHours))초입니다.")
    }
}
