//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

fileprivate extension Constants {
    static let clientCountRange: ClosedRange<Int> = 10 ... 30
}

private let bank = Bank(
    bankClerks: createBankClerk(
        Constants.numberOfDepositBankClerks,
        Constants.numberOfLoanBankClerks
    ),
    clientCount: Int.random(in: Constants.clientCountRange)
)

private let bankManager = BankManager(bank: bank)

private func createBankClerk(
    _ numberOfDepositBankClerks: Int,
    _ numberOfLoanBankClerks: Int
) -> [BankClerk] {
    var bankClerks: [BankClerk] = []
    
    for order in 1 ... numberOfDepositBankClerks {
        bankClerks.append(
            BankClerk(
                name: "\(BankServiceType.deposit)\(order)",
                service: .deposit
            )
        )
    }
    
    for order in 1 ... numberOfLoanBankClerks {
        bankClerks.append(
            BankClerk(
                name: "\(BankServiceType.loan)\(order)",
                service: .loan
            )
        )
    }
    
    return bankClerks
}

do {
    try bankManager.startProgram()
} catch {
    print(error.localizedDescription)
}
