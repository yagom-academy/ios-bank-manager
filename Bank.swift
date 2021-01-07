//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class Bank {
    private var clients: [Client] = []
    private var tellers: [Teller] = []
    private var finishedClientNumber = 0
    private var businessTime: TimeInterval?
        
    func printMenu() {
        print(BankMenu.description, terminator: " ")
    }
    
    func operateBank(teller: Int, client: Int) {
        var openTime = Date()
        
        openTime = Date()
        initTellerNumber(teller)
        initClientNumber(client)
        sortClientByPriority()
        dump(clients)
        assignBusinessToTeller()
        businessTime = Date().timeIntervalSince(openTime)
        printCloseMessage()
        closeBank()
    }
    
    private func initTellerNumber(_ number: Int) {
        for windowNumber in 1...number {
            tellers.append(Teller(windowNumber: windowNumber))
        }
    }
    
    private func initClientNumber(_ number: Int) {
        func randomNumber(maxNumber: Int) -> Int {
            return Int.random(in: 0..<maxNumber)
        }
        
        for waitingNumber in 1...number {
            guard let businessType = BusinessType(rawValue: randomNumber(maxNumber: BusinessType.allCases.count)), let priority = Client.Priority(rawValue: randomNumber(maxNumber: Client.Priority.allCases.count)) else {
                return
            }
            
            clients.append(Client(waitingNumber: waitingNumber, businessType: businessType, priority: priority))
        }
    }
    
    private func sortClientByPriority() {
        let firstGroup: [Client] = clients.filter({ $0.priority == .first})
        let secondGroup: [Client] = clients.filter({ $0.priority == .second})
        let thirdGroup: [Client] = clients.filter({ $0.priority == .third})
        
        clients = firstGroup + secondGroup + thirdGroup
    }
    
    private func assignBusinessToTeller() {
        let semaphore = DispatchSemaphore(value: 0)
        var isContinue = true
        
        while isContinue {
            for teller in self.tellers {
                if self.clients.count == 0 {
                    isContinue = false
                    break
                }
                if teller.isNotWorking {
                    let client = clients.removeFirst()
                    teller.workingQueue.async {
                        teller.handleBusiness(for: client)
                        semaphore.signal()
                    }
                    self.finishedClientNumber += 1
                }
            }
        }
        for _ in 0..<finishedClientNumber { semaphore.wait() }
    }
    
    private func printCloseMessage() {
        guard let businessTime = businessTime else {
            print(BankError.unknown.description)
            return
        }
        let message = String(format: BankConstant.closeMessage, finishedClientNumber, businessTime)
        print(message)
    }
    
    private func closeBank() {
        tellers.removeAll()
        clients.removeAll()
        finishedClientNumber = 0
    }
}
