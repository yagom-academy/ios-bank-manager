//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var bankWorkers: [BankWorker] = generateBankWorkers()
var bankManager: BankManager = BankManager(bankWorkers: bankWorkers)
var bank: Bank = Bank(bankManager: bankManager)

private func generateBankWorkers() -> [BankWorker] {
    var bankWorkers: [BankWorker] = []
    
    for _ in 0...2 {
        let bankWorker = BankWorker()
        bankWorkers.append(bankWorker)
    }
    
    return bankWorkers
}

private func generateClient() {
    let randomNumber = Int.random(in: ClientNumber.min...ClientNumber.max)
    for _ in 1...randomNumber {
        let randomWork = [BankWork.loan, BankWork.deposit].randomElement() ?? .deposit
        let client = Client(ticketNumber: bank.publishTicketNumber(), requestWork: randomWork)
        bankManager.addClientQueue(client)
    }
}

generateClient()
bank.openSystem()
