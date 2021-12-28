//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    var clients: Clients
    let clerk: BankClerk
    let dispatchGroup = DispatchGroup()
    
    init(clients: Clients, clerk: BankClerk) {
        self.clients = clients
        self.clerk = clerk
    }
    
    func operateBankSystem() {
        let totalClientCount = clients.makeWaitingLine()
        let startTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        
        startBankTask()
        dispatchGroup.wait()
        
        let endTime: CFAbsoluteTime = CFAbsoluteTimeGetCurrent()
        let totalWorkingTime: CFAbsoluteTime = endTime - startTime
        
        announceClose(with: totalClientCount, during: totalWorkingTime)
    }
    
    private func startBankTask() {
        let depositSemaphore = DispatchSemaphore(value: Bank.depositClerkCount)
        let loanSemaphore = DispatchSemaphore(value: Bank.loanClerkCount)
        
        while let taskType = clients.informTaskType(),
              let clientIdentifier = clients.dequeueWaitingLine() {
            DispatchQueue.global().async(group: dispatchGroup) {
                switch taskType {
                case .deposit:
                    depositSemaphore.wait()
                    self.clerk.work(for: clientIdentifier, task: taskType)
                    depositSemaphore.signal()
                case .loan:
                    loanSemaphore.wait()
                    self.clerk.work(for: clientIdentifier, task: taskType)
                    loanSemaphore.signal()
                }
            }
        }
    }
    
    private func announceClose(with totalClientCount: Int, during totalWorkingTime: CFAbsoluteTime) {
        Bank.printClosingMessage(totalClientCount: totalClientCount,
                                 totalWorkingTime: totalWorkingTime.formatted)
    }
}
