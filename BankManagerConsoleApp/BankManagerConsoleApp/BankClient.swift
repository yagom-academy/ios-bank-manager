//
//  BankClient.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation

struct BankClient: Client {
    var bankType: BankType = BankType.random
    var waitingNumber: Int
}
