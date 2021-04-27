//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank
    private let bankTeller: BankTeller
    private let looper: Looper
    private let consoleViewer: ConsoleViewer
    var stubbedCustomerNumber: Int?
    
    init(bank: Bank, bankTeller: BankTeller, looper: Looper, consoleViewer: ConsoleViewer) {
        self.bank = bank
        self.bankTeller = bankTeller
        self.looper = looper
        self.consoleViewer = consoleViewer
    }
    
    mutating func openBank() {
        while looper.shouldContinue(userInput: getUserInput()) {
            let customerNumber = Int.random(in: 10...30)
            for _ in 1...customerNumber {
                bankTeller.handleBanking(ofCustomerNumber: bank.getNewTicket())
            }
            bank.closeBank()
        }
    }
    
    func getUserInput() -> String {
        consoleViewer.showStartMenu()
        guard let userInput = readLine() else {
            return ""
        }
        return userInput
    }
}

