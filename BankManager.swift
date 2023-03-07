//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    var clientNumber: Int = Int.random(in: 10...30)
    var waitingQueue = Queue<String>()
    
    mutating func updateWaitingQueue() {
        for number in 1...clientNumber {
            waitingQueue.enqueue("\(number)번 고객")
        }
    }
    
    mutating func dequeueWaitingQueue() {
        while !waitingQueue.isEmpty {
            guard let client = waitingQueue.dequeue() else { return }
            print("\(client) 업무 시작")
            Thread.sleep(forTimeInterval: 0.7)
            print("\(client) 업무 완료")
        }
    }
}
