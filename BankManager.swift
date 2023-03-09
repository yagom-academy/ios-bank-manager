//
//  BankManager.swift
//  Created by Rowan, 릴라.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private let bank: Bank
    private var isRunning: Bool
    
    init(bank: Bank, isRunning: Bool = true) {
        self.bank = bank
        self.isRunning = isRunning
    }
    
    mutating func start() {
        while self.isRunning {
            printMenu()
            handleMenuInput()
        }
    }
    
    private func printMenu() {
        let menuText = """
            1 : 은행 개점
            2 : 종료
            입력 :
            """
        
        print(menuText, terminator: " ")
    }
    
    private mutating func handleMenuInput() {
        guard let userInput = readLine() else { return }
        
        switch userInput {
        case "1":
            bank.open()
//            bank.reportResult()
        case "2":
            isRunning = false
        default:
            let message = "잘못 입력하셨습니다."
            print(message)
        }
    }
}
