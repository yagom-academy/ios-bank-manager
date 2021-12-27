//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager: Managable {
    var clients = Clients()
    let clerk = BankClerk()
    let clerkIdentifier: Int
    var totalWorkingTime: CFAbsoluteTime = .zero
    
    mutating func operateBankSystem() {
        let totalClientCount = clients.makeWaitingLine()
        
        dequeueWaitingLine()
        announceClose(with: totalClientCount)
    }
    
    private func manageClerk(_ clerkIdentifier: Int, for clientIdentifier: Int) {
        giveWork(to: clerkIdentifier).sync {
            clerk.work(for: clientIdentifier)
        }
    }
    
    mutating private func dequeueWaitingLine() {
        let startTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        
        while clients.startTask() > Bank.emptyWaitingLine {
            manageClerk(clerkIdentifier, for: clients.startTask())
            clients.completeTask()
        }
        
        let endTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        totalWorkingTime = endTime - startTime
    }
    
    private func announceClose(with totalClientCount: Int) {
        Bank.printClosingMessage(totalClientCount: totalClientCount, totalWorkingTime: totalWorkingTime.formatted)
    }
}
