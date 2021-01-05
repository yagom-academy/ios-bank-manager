//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    private var tellers: [Teller] = []
    private var clients: [Client] = []
    private var needTimeToWork: Double = 0.7
    private var numberOfClients: Int {
        return clients.count
    }
    private var businessTimes: Double {
        return Double(numberOfClients) * needTimeToWork
    }
    
    func printMenu() {
        print(BankMenu.description, terminator: "")
    }

    private func initTellerNumber(_ number: Int) {
        for windowNumber in 1...number {
            tellers.append(Teller(windowNumber: windowNumber))
        }
    }
    
    private func initClientNumber(_ number: Int) {
        for waitingNumber in 1...number {
            clients.append(Client(waitingNumber: waitingNumber, needTimeToWork: needTimeToWork))
        }
    }
    
    private func assignBusinessToTeller() {
        for client in clients {
            for teller in tellers {
                if teller.isNotWorking {
                    teller.handleBusiness(for: client)
                    break;
                }
            }
        }
    }
    
    private func printCloseMessage() {
        let businessTimesText: String = String(format: "%.2f", businessTimes)
        let message = Bank.closeMessageFront + "\(numberOfClients)" + Bank.closeMessageMiddle + "\(businessTimesText)" + Bank.closeMessageEnd
        print(message)
    }
}
