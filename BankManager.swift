//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class BankManager {
    private var tellers: [Teller] = []
    private var clients: [Client] = []
    private var currentClientNumber = 0
    private var needTimeToWork = 0.7
    private var numberOfClients: Int {
        return clients.count
    }
    private var businessTimes: Double {
        return Double(numberOfClients) * needTimeToWork
    }
    
    func printMenu() {
        print(BankMenu.description, terminator: "")
    }
    
    func operateBank(teller: Int, client: Int) {
        initTellerNumber(teller)
        initClientNumber(client)
        assignBusinessToTeller()
        sleep(1)
        printCloseMessage()
        reset()
    }
    
    private func initTellerNumber(_ number: Int) {
        for windowNumber in 1...number {
            tellers.append(Teller(windowNumber: windowNumber, needTimeToWork: needTimeToWork))
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
            DispatchQueue.global().async {
                for teller in self.tellers {
                    if self.currentClientNumber >= self.numberOfClients {
                        `continue` = false
                        break
                    }
                    if teller.isNotWorking {
                        self.currentClientNumber += 1
                        teller.handleBusiness(for: self.currentClientNumber)
                    }
                }
            }
        }
    }
    
    private func printCloseMessage() {
        let businessTimesText: String = String(format: "%.2f", businessTimes)
        let message = Bank.closeMessageFront + "\(numberOfClients)" + Bank.closeMessageMiddle + "\(businessTimesText)" + Bank.closeMessageEnd
        print(message)
    }
    
    private func reset() {
        tellers.removeAll()
        clients.removeAll()
        currentClientNumber = 0
    }
}
