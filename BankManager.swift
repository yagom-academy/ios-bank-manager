//
//  BankManager.swift
//  Created by Eddy, dudu.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

fileprivate extension Double {
    var formattedTime: String {
        let difference = floor(self * 10) / 10
        return String(format: "%.2f", difference)
    }
}

private enum MenuOption: String {
    case bankOpen = "1"
    case exit = "2"
    case invalidInput
}

final class BankManager {
    private lazy var bank: Bank = {
        let loanWindow = BankLoanWindow()
        
        let depositWindow = BankDepositWindow()
        
        let bank = Bank(loanWindow: loanWindow, depositWindow: depositWindow)
        bank.delegate = self
        
        return bank
    }()
    
    func start() {
        printMenu()
        
        switch inputUserOption() {
        case .bankOpen:
            bank.add(customers: BankCustomer.make(numberOfCustomer: 10))
            bank.open()
            
            start()
        case .exit:
            break
        case .invalidInput:
            print("잘못 입력했습니다. 다시 입력해주세요")
            start()
        }
    }
    
    private func printMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    private func inputUserOption() -> MenuOption {
        guard let userInput = readLine()?.trimmingCharacters(in: .whitespaces),
              let userSelection = MenuOption(rawValue: userInput) else { return .invalidInput }
        
        return userSelection
    }
}

extension BankManager: BankDelegate {
    func customerWorkDidStart(_ bank: Bank, waitingNumber: Int, workType: Banking) {
        print("\(waitingNumber)번 고객 \(workType.name)업무 시작")
    }
    
    func customerWorkDidFinish(_ bank: Bank, waitingNumber: Int, workType: Banking) {
        print("\(waitingNumber)번 고객 \(workType.name)업무 완료")
    }
    
    func bankWorkDidFinish(_ bank: Bank) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.customerCount)명이며, 총 업무 시간은 \(bank.duration.formattedTime)초입니다.")
    }
}
