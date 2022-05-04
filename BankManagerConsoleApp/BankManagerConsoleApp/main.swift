//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

fileprivate extension Constants {
    static let clientCountRange: ClosedRange<Int> = 10 ... 30
}

typealias QueueDictionary = [String: Queue<Client>]

private let bank = Bank(
    bankClerks: createBankClerk(
        Constants.numberOfDepositBankClerks,
        Constants.numberOfLoanBankClerks
    ),
    clientCount: Int.random(in: Constants.clientCountRange),
    queueDictionary: createQueueDictionary()
)

private let bankManager = BankManager(bank: bank)

private func createQueueDictionary() -> QueueDictionary {
    var queueDictionary: QueueDictionary = [:]
    
    BankServiceType.allCases.forEach { bankService in
        queueDictionary.updateValue(Queue<Client>(), forKey: bankService.description)
    }
    
    return queueDictionary
}

private func createBankClerk(
    _ numberOfDepositBankClerks: Int,
    _ numberOfLoanBankClerks: Int
) -> [BankClerk] {
    var bankClerks: [BankClerk] = []
    
    for order in 1 ... numberOfDepositBankClerks {
        bankClerks.append(
            BankClerk(
                name: "\(BankServiceType.deposit)\(order)",
                bankService: .deposit
            )
        )
    }
    
    for order in 1 ... numberOfLoanBankClerks {
        bankClerks.append(
            BankClerk(
                name: "\(BankServiceType.loan)\(order)",
                bankService: .loan
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
