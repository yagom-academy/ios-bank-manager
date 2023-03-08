//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/08.
//

import Foundation

struct Bank {
    var waitingLine = Queue<Client>()
    var todayClient: Int = 10
    var BankClerkCount: Int = 1

    mutating func lineUpClient() {
        todayClient = Int.random(in: 10...30)
        for number in 1...todayClient {
            let currentClient = Client(number: number)
            waitingLine.enqueue(currentClient)
        }
    }
}
