//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let bankWorker: BankWorker = BankWorker()
var bank: Bank = Bank(bankWorker: bankWorker)

func generateClient() {
    let randomNumber = Int.random(in: 10...30)
    
    for number in 1...randomNumber {
        let client = Client(ticketNumber: number)
        bank.updateClientList(client)
    }
}
