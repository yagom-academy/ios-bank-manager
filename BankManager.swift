//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    static let shared = BankManager()
    var clients: [Client] = []
    private var tellers: [Teller] = []
    private var currentClientNumber = 0
    private var businessTime: Double {
        var sum: Double = 0
        clients.forEach { client in
            sum += client.businessType.neededTime
        }
        return sum
    }
    
    private init() {}
    
    func printMenu() {
        print(BankMenu.description, terminator: "")
    }
    
    func operateBank(teller: Int, client: Int) {
        initTellerNumber(teller)
        initClientNumber(client)
        assignBusinessToTeller()
        sleep(1)
        printCloseMessage()
        closeBank()
    }
    
    private func initTellerNumber(_ number: Int) {
        for windowNumber in 1...number {
            tellers.append(Teller(windowNumber: windowNumber))
        }
    }
    
    private func initClientNumber(_ number: Int) {
        for waitingNumber in 1...number {
            clients.append(Client(waitingNumber: waitingNumber))
        }
    }
    
    private func assignBusinessToTeller() {
        var `continue` = true
        while `continue` {
            for teller in self.tellers {
                if self.currentClientNumber >= self.clients.count - 1{
                    `continue` = false
                    break
                }
                if teller.isNotWorking {
                    teller.handleBusiness(for: self.currentClientNumber)
                    self.currentClientNumber += 1
                }
            }
        }
    }
    
    private func printCloseMessage() {
        let message = String(format: Bank.closeMessage, clients.count, businessTime)
        print(message)
    }
    
    private func closeBank() {
        tellers.removeAll()
        clients.removeAll()
        currentClientNumber = 0
    }
}
