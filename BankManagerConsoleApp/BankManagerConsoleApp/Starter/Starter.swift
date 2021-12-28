//
//  Starter.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/23.
//

import Foundation

final class Starter {
    private var shouldContinue: Bool = true
    
    func start() {
        while shouldContinue {
            printStartMessage()
            do {
                try checkInput()
            } catch {
                if let error = error as? StarterError {
                    error.printDescription()
                }
            }
        }
    }
    
    private func printStartMessage() {
        print(StarterMessage.open, terminator: "")
    }
    
    private func receiveInput() throws -> String {
        guard let input = readLine() else {
            throw StarterError.endOfFile
        }
        return input
    }
    
    private func checkInput() throws {
        let input = try receiveInput()
        
        switch input {
        case "1":
            runBankProgram()
        case "2":
            shouldContinue = false
        default :
            throw StarterError.wrongInput
        }
    }
    
    private func runBankProgram() {
        let employee = Employee()
        let bankManager = BankManager(employee: employee)
        let bank = Bank(employee: employee, bankManager: bankManager)
        bank.open()
    }
}
