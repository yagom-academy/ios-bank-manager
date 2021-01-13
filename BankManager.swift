//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank
    private var clientQueue = [Client]()
    
    init() {
        let clerkNumber: Int = 3
        self.bank = Bank(employeeNumber: clerkNumber)
    }
    
    mutating func openBank() throws {
        try generateRandomClients() 
        print(ConsoleOutput.bankOpening.message)
        bank.startTimer()
        bank.makeAllClerksWork()
    }
    
    private mutating func generateRandomClients() throws {
            let newClient = Client()
            clientQueue.append(newClient)
        }
        try bank.updateWaitingList(from: clientQueue)
    }
    
    func closeBank() {
        bank.stopTimer()
        bank.printEndingMent()
    }
}

