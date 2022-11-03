//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Minii All rights reserved.

struct ConsoleManager {
    func startConsole() -> Int {
        print("""
        1 : 은행개점
        2 : 종료
        입력 :
        """, terminator: " ")
        
        return validateUserInput()
    }
    
    private func inputUserSelect() -> Int? {
        guard let input = readLine() else { return nil }
        return Int(input)
    }
    
    private func validateUserInput() -> Int {
        guard let filteredInput = inputUserSelect() else { return 0 }
        return filteredInput
    }
}
