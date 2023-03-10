//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

struct BankManager {
    private var bank: Bank = .init()
    
    mutating func startBankManager() {
        while true {
            printBankMenu()
            let userInput = readLine()
            
            switch userInput {
            case "1":
                bank.openBank()
            case "2":
                return
            default:
                print("잘못 입력하셨습니다. 다시 입력해주세요")
            }
        }
    }
    
    private func printBankMenu() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
}
