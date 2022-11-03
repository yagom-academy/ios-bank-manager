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
            
            print("업무를 마감합니다. 오늘 업무를 처리한 고객은 총 XX명이며, 총 업무시간은 XX초입니다.")
            startConsole()
        case 2:
            return
        default:
            print("잘못된 입력입니다.")
            startConsole()
        }
    }
}
