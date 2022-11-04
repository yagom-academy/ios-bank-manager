//
//  main.swift
//  BankManagerConsoleApp

import Foundation

var bankManager = BankManager()

while bankManager.isRunning {
    do {
        try bankManager.run()
    } catch {
        if let error = error as? BankError {
            print(error.localizedDescription)
        }
    }
}
