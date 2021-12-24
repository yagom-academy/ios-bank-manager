//
//  Starter.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/23.
//

import Foundation

struct Starter {
    private var shouldContinue: Bool = true
    
    private func printStartMessage() {
        print(StarterMessage.open.description, terminator: "")
    }
    
    private func receiveInput() throws -> String {
        guard let input = readLine() else {
            throw StarterError.endOfFile
        }
        return input
    }
    
    mutating func start() {
        while shouldContinue {
            printStartMessage()
            do {
                try checkInput()
            } catch StarterError.wrongInput {
                print(StarterError.wrongInput)
            } catch StarterError.endOfFile {
                print(StarterError.endOfFile)
            } catch {
                print(StarterError.unknownError)
            }
        }
    }
    
    private mutating func checkInput() throws {
        let input = try receiveInput()
        
        switch input {
        case "1":
            let employee = Employee()
            let bank = Bank(employee: employee)
            bank.open()
        case "2":
            shouldContinue = false
        default :
            throw StarterError.wrongInput
        }
    }
}
