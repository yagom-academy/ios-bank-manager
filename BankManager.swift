//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager: Managable {
    var clients = Clients()
    let clerk = BankClerk()
    let clerkNumber: Int
    var duration: CFAbsoluteTime = .zero
    
    mutating func operateBankSystem() {
        let totalNumberOfClients = clients.makeWaitingLine()
        
        dequeueWaitingLine()
        announceClose(with: totalNumberOfClients)
    }
    
    private func manageClerk(_ clerkNumber: Int, for client: Int) {
        giveWork(to: clerkNumber).sync {
            clerk.work(for: client)
        }
    }
    
    mutating private func dequeueWaitingLine() {
        let startTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        
        while clients.startTask() > Bank.emptyWaitingLine {
            manageClerk(clerkNumber, for: clients.startTask())
            clients.completeTask()
        }
        
        let endTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        duration = endTime - startTime
    }
    
    private func announceClose(with totalNumberOfClients: Int) {
        Bank.printClosingMessage(totalClients: totalNumberOfClients, duration: duration.formatted)
    }
}
