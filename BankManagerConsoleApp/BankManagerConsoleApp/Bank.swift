//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

struct Bank {
    let bankClerks: BankClerk
    
    func start() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 :", terminator: " ")
        
        selectMenu()
    }
    
    func selectMenu() {
        guard let userInput = readLine() else { return }
        
        switch userInput {
        case "1":
            startBankService()
        case "2":
            return
        default:
            print("잘못된 입력입니다.")
        }
        
        start()
    }
    
    func startBankService() {
        
    }
}
