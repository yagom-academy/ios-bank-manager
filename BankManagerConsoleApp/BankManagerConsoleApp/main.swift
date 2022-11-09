//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

var bankWorker1: BankWorker = BankWorker()
var bankWorker2: BankWorker = BankWorker()
var bankWorker3: BankWorker = BankWorker()
var bankWorkers: [BankWorker] = [bankWorker1, bankWorker2, bankWorker3]
var bankManager: BankManager = BankManager(bankWorkers: bankWorkers)
var bank: Bank = Bank(bankManager: bankManager)

private func generateClients() {
    var clients: [Client] = []
    
    let randomNumber = Int.random(in: ClientNumber.min...ClientNumber.max)
    for _ in 1...randomNumber {
        let work = [BankWork.loan, BankWork.deposit].randomElement() ?? .deposit
        let client = Client(ticketNumber: bank.publishTicketNumber(), requestingWork: work)
        clients.append(client)
    }
    
    clients.forEach {
        bank.addClient($0)
    }
}

generateClients()
bank.openSystem()
