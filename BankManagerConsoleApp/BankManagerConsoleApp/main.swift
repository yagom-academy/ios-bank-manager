//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

fileprivate extension Constants {
    static let clientCountRange: ClosedRange<Int> = 10 ... 30
    static let workSpeed: Double = 0.7
    static let temporaryName = "임시이름"
}

let bankClerk = BankClerk(
    name: Constants.temporaryName,
    workSpeed: Constants.workSpeed
)

let bank = Bank(
    bankClerk: bankClerk,
    clientCount: Int.random(in: Constants.clientCountRange)
)

let bankManager = BankManager(
    bankClerk: bankClerk,
    bank: bank
)

do {
    try bankManager.startProgram(bank: bank, bankClerk: bankClerk)
} catch {
    print(error.localizedDescription)
}
