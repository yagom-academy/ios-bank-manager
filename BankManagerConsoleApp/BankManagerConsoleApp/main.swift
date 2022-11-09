//
//  main.swift
//  BankManagerConsoleApp

import Foundation

let bank: Bank = Bank(depositClerks: 2, loanClerks: 1)
var bankManager: BankManager = BankManager(bank: bank)

while bankManager.isRunning {
    do {
        try bankManager.run()
    } catch {
        if let error = error as? BankError {
            print(error.localizedDescription)
        }
    }
}
