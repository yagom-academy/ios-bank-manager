//
//  Starter.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/23.
//

import Foundation

struct Starter {
    var shouldContinue: Bool = true
    
    func printStartMessage() {
        print(StarterMessage.open.description, terminator: "")
    }
    
    func receiveInput() -> String {
        let input = readLine() ?? ""
        return input
    }
    
    mutating func start() {
        while shouldContinue {
            printStartMessage()
            do {
                try checkInput()
            } catch {
                print(StarterMessage.wrongInput)
            }
        }
    }
    
    mutating func checkInput() throws {
        let input = receiveInput()
        
        switch input {
        case "1": print("은행 열린다!!")
        case "2": shouldContinue = false
        default : throw StarterError.wrongInput
        }
    }
}
