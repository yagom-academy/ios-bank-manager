//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

let bankWorkers: [BankWorker] = [BankWorker(bankWork: .deposit),
                                 BankWorker(bankWork: .deposit),
                                 BankWorker(bankWork: .loan)]
let bankManager: BankManager = BankManager(bankWorkers: bankWorkers)
var bank: Bank = Bank(bankManager: bankManager)

private func generateClient() {
    let randomNumber = Int.random(in: ClientNumber.min...ClientNumber.max)
    for number in 1...randomNumber {
        let randomWork = BankWork.allCases.randomElement() ?? .deposit
        let client = Client(ticketNumber: bank.publishTicketNumber(), requestWork: randomWork)
        bankManager.addClientQueue(client)
    }
}

generateClient()
bank.openSystem()
