//
//  BankManager.swift
//  Created by Rowan, 릴라.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    private var bank: Bank = Bank()
    private var isRunning: Bool = true
    
    mutating func start() {
        while isRunning == true {
            printMenu()
        }
    }
    
    mutating func printMenu() {
        let menuText = """
            1 : 은행 개점
            2 : 종료
            입력 :
            """
        
        print(menuText, terminator: " ")
        
        guard let userInput = readLine() else { return }
        
        switch userInput {
        case "1":
            openBank()
        case "2":
            isRunning = false
        default:
            print("잘못 입력하셨습니다.")
        }
    }
    
    func openBank() {
        let totalCustomer = bank.open()
        let totalProcessTime = Double(totalCustomer) * Banker.processTime
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은 \(totalProcessTime) 입니다.")
    }
}
