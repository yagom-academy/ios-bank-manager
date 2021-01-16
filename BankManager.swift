//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank
    private var clientQueue = [ClientOperation]()
    
    init() {
        let clerkNumber: Int = 3
        self.bank = Bank(employeeNumber: clerkNumber)
    }
    
    mutating func openBank() throws {
        try generateRandomClients() 
        print(ConsoleOutput.bankOpening.message)
        bank.startTimer()
        bank.startWorking()
    }
    
    private mutating func generateRandomClients() throws {
        let randomClientNumber = Int.random(in: 10...30)
        for i in 1...randomClientNumber {
            let newClient = ClientOperation(waitingNumber: i)
            clientQueue.append(newClient)
        }
        
        try bank.updateWaitingList(from: clientQueue)
    }
    
    func closeBank() {
        bank.stopTimer()
        bank.printEndingMent()
    }
}

