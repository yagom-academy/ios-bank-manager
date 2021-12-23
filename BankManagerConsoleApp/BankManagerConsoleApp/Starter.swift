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
    
    func receiveInput() throws -> String {
        guard let input = readLine() else {
            throw StarterError.outOfInput
        }
        
        return input
    }
}
