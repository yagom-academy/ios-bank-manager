//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

struct ConsoleManager {
    private var bankManager: BankManager
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    mutating func startConsole() {
        showMenu()
        doAct(userInput: validateUserInput())
    }
    
    private func showMenu() {
        print("""
        1 : 은행개점
        2 : 종료
        입력 :
        """, terminator: " ")
    }
    
    private func inputUserSelect() -> Int? {
        guard let input = readLine() else { return nil }
        return Int(input)
    }
    
    private func validateUserInput() -> Int {
        guard let filteredInput = inputUserSelect() else { return 0 }
        return filteredInput
    }
    
    private mutating func doAct(userInput: Int) {
        switch userInput {
        case 1:
            bankManager.openBank()
            bankManager.startBankWork()
            bankManager.closeBank()
            startConsole()
        case 2:
            return
        default:
            print("잘못된 입력입니다.")
            startConsole()
        }
    }
}
