//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var bankWorkers: [BankWorker] = []
var bankManager: BankManager = BankManager(bankWorkers: bankWorkers)
var bank: Bank = Bank(bankManager: bankManager)

private func generateBankWorkers() {
    for _ in 0...2 {
        let bankWorker = BankWorker()
        bankWorkers.append(bankWorker)
    }
}

private func generateClient() {
    let randomNumber = Int.random(in: ClientNumber.min...ClientNumber.max)
    for _ in 1...randomNumber {
        let randomWork = BankWork.allCases.randomElement() ?? .deposit
        let client = Client(ticketNumber: bank.publishTicketNumber(), requestWork: randomWork)
        bankManager.addClientQueue(client)
    }
}

generateBankWorkers()
generateClient()
bank.openSystem()
