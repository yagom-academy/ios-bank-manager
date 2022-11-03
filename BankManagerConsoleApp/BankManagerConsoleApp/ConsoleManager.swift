//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

struct ConsoleManager {
    func startConsole() {
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
    
    private func doAct(userInput: Int) {
        switch userInput {
        case 1:
            // TODO: - Bank문열고 업무 시작하기
            var bankManager = BankManager()
            bankManager.openBank()
            bankManager.startBankWork()
            
            startConsole()
        case 2:
            return
        default:
            print("잘못된 입력입니다.")
            startConsole()
        }
    }
}
