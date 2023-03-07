//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var clientNumber = 0
    var waitingQueue = Queue<String>()
    
    mutating func setupWaitingQueueAndClientNumber() {
        for number in 1...Int.random(in: 10...30) {
            waitingQueue.enqueue("\(number)번 고객")
        }
        
        clientNumber = waitingQueue.size
    }
    
    mutating func startBusiness() {
        while !waitingQueue.isEmpty {
            guard let client = waitingQueue.dequeue() else { return }
            print("\(client) 업무 시작")
            Thread.sleep(forTimeInterval: 0.7)
            print("\(client) 업무 완료")
        }
        
        let businessHours = Double(clientNumber) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientNumber)명이며, 총 엄무시간은 \(String(format: "%.2f", businessHours))초입니다.")
    }
}
