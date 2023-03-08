//
//  BankManager.swift
//  Created by Rowan, 릴라.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private let bank: Bank = Bank()
    private var isRunning: Bool = true
    
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
            bank.reportResult()
        case "2":
            isRunning = false
        default:
            let message = "잘못 입력하셨습니다."
            print(message)
        }
    }
}
