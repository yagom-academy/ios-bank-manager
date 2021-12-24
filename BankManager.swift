//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager: Managable {
    var waitingLine = Queue<Int>()
    let numberOfClients = Clients().countTotalNumberOfClients()
    let clerk = BankClerk()
    let clerkNumber: Int
    var duration: CFAbsoluteTime = .zero
    
    mutating func operateBankSystem() {
        makeWaitingLine()
        dequeueWaitingLine()
        announceClose()
    }
    
    mutating private func makeWaitingLine() {
        (1...numberOfClients).forEach { client in
            waitingLine.enqueue(client)
        }
    }
    
    private func manageClerk(_ clerkNumber: Int, for client: Int) {
        giveWork(to: clerkNumber).sync {
            clerk.work(for: client)
        }
    }
    
    mutating private func dequeueWaitingLine() {
        let startTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        
        while let client = waitingLine.dequeue() {
            manageClerk(clerkNumber, for: client)
        }
        
        let endTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        duration = endTime - startTime
    }
    
    private func announceClose() {
        Bank.announceClose(numberOfClients: numberOfClients, duration: duration.formatted)
    }
}
