//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager: Managable {
    var clients: Clients
    let clerk: BankClerk
    let totalClerkCount: Int
    
    mutating func operateBankSystem() {
        let totalClientCount = clients.makeWaitingLine()
        let startTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()

        dequeueWaitingLine()
        
        let endTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        let totalWorkingTime: CFAbsoluteTime = endTime - startTime
        
        announceClose(with: totalClientCount, during: totalWorkingTime)
    }
    
    private func manageClerk(_ clerkIdentifier: Int, for clientIdentifier: Int) {
        giveWork(to: clerkIdentifier).sync {
            clerk.work(for: clientIdentifier)
        }
    }
    
    mutating private func dequeueWaitingLine() {
        while clients.startTask() > Bank.emptyWaitingLine {
            manageClerk(clerk.identifier, for: clients.startTask())
            clients.completeTask()
        }
    }
    
    private func announceClose(with totalClientCount: Int, during totalWorkingTime: CFAbsoluteTime) {
        Bank.printClosingMessage(totalClientCount: totalClientCount,
                                 totalWorkingTime: totalWorkingTime.formatted)
    }
}
