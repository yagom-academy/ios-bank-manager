//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager: Managable {
    var clients: Clients
    let clerk: BankClerk
    let totalClerkCount: Int
    let dispatchGroup = DispatchGroup()

    init(clients: Clients, clerk: BankClerk, totalClerkCount: Int) {
        self.clients = clients
        self.clerk = clerk
        self.totalClerkCount = totalClerkCount
    }
    
    func operateBankSystem() {
        let totalClientCount = clients.makeWaitingLine()
        let startTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        
        dequeueWaitingLine()
        
        let endTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        let totalWorkingTime: CFAbsoluteTime = endTime - startTime
        
        dispatchGroup.wait()
        announceClose(with: totalClientCount, during: totalWorkingTime)
    }
    
    private func manageClerk(clientIdentifier: Int, taskType: Bank.Task) {
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)
        
        switch taskType {
        case .deposit:
            depositSemaphore.wait()
            clerk.work(for: clientIdentifier, task: taskType)
            depositSemaphore.signal()
        case .loan:
            loanSemaphore.wait()
            clerk.work(for: clientIdentifier, task: taskType)
            loanSemaphore.signal()
        }
    }
    
    private func dequeueWaitingLine() {
        let semaphore = DispatchSemaphore(value: 3)
        
        while let taskType = clients.informTaskType(),
              let clientIdentifier = clients.startTask() {
            DispatchQueue.global().async(group: dispatchGroup) {
                semaphore.wait()
                self.manageClerk(clientIdentifier: clientIdentifier, taskType: taskType)
                semaphore.signal()
            }
        }
    }
    
    private func announceClose(with totalClientCount: Int, during totalWorkingTime: CFAbsoluteTime) {
        Bank.printClosingMessage(totalClientCount: totalClientCount,
                                 totalWorkingTime: totalWorkingTime.formatted)
    }
}
