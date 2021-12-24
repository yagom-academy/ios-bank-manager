//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager: Managable {
    var waitingLine = Queue<Int>()
    let clerk = BankClerk()
    let clerkNumber: Int

    mutating func makeWaitingLine(by numberOfClients: Int) {
        (1...numberOfClients).forEach { client in
            waitingLine.enqueue(client)
        }
    }
    
    func manageClerk(_ clerkNumber: Int, for client: Int) {
        giveWork(to: clerkNumber).sync {
            clerk.work(for: client)
        }
    }
    
    mutating func dequeueWaitingLine() {
        while let client = waitingLine.dequeue() {
            manageClerk(clerkNumber, for: client)
        }
    }
}
