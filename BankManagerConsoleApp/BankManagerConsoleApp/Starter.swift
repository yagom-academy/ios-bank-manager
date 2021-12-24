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
    
    mutating func checkInput() throws {
        do {
            let input = try receiveInput()
            
            switch input {
            case "1": print("은행 열린다!!")
            case "2": shouldContinue = false
            default : throw StarterError.wrongInput
            }
        }
    }
}
