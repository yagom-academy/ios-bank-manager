//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let bankWorker = BankWorker()
var bank = Bank(bankWorker: bankWorker)
var clients: [Client] = []

for number in 1...Int.random(in: 10...30) {
    clients.append(Client(waitingNumber: number))
}

bank.openBank(clients: clients)
