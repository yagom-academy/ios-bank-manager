//
//  BankManager.swift
//  Created by Rowan, 릴라.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private let bank: Openable
    private var isRunning: Bool = true
    private var customerReceiver: Receivable
    
    init(bank: Openable, customerReceiver: Receivable) {
        self.bank = bank
        self.customerReceiver = customerReceiver
    }
    
    mutating func start() {
        while self.isRunning {
            printMenu()
            guard let userInput = readInput() else { return }
            handleMenuInput(userInput)
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
    
    private func readInput() -> String? {
        let userInput = readLine()
        
        return userInput
    }
    
    private mutating func handleMenuInput(_ userInput: String) {
        switch userInput {
        case "1":
            let totalCustomer = customerReceiver.receiveCustomer()
            bank.open(totalCustomer: totalCustomer)
        case "2":
            isRunning = false
        default:
            let message = "잘못 입력하셨습니다."
            print(message)
        }
    }
    
}
