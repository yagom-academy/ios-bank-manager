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
        while let taskType = clients.informTaskType(),
              let clientIdentifier = clients.takeTurn() {
            giveTask(of: taskType, for: clientIdentifier)
        }
    }
    
    private func giveTask(of taskType: Bank.Task, for clientIdentifier: Int) {
        let semaphore = taskType.semaphore
        
        DispatchQueue.global().async(group: dispatchGroup) {
            semaphore.wait()
            self.clerk.work(for: clientIdentifier, task: taskType)
            semaphore.signal()
        }
    }
    
    private func announceClose(with totalClientCount: Int, during totalWorkingTime: CFAbsoluteTime) {
        Bank.printClosingMessage(totalClientCount: totalClientCount,
                                 totalWorkingTime: totalWorkingTime.formatted)
    }
}
