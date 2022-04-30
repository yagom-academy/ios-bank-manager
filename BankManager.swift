//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

private enum MenuOption: String {
    case bankOpen = "1"
    case exit = "2"
}

class BankManager {
    private let bank = Bank(window: BankCommonWindow())

    init() {
        bank.delegate = self
    }
    
    func start() {
        printMenu()
        
        switch inputUserOption() {
        case .bankOpen:
            bank.add(customers: BankCustomer.randomCustomers())
            bank.open()
            start()
        case .exit:
            break
        case .none:
            print("잘못 입력했습니다. 다시 입력해주세요")
            start()
        }
    }
    
    private func printMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    private func inputUserOption() -> MenuOption? {
        guard let userInput = readLine()?.trimmingCharacters(in: .whitespaces),
              let userSelection = MenuOption(rawValue: userInput) else { return nil }
        
        return userSelection
    }
}

extension BankManager: BankDelegate {
    func bankWorkDidFinish(count : Int, hour: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(count)명이며, 총 업무 시간은 \(hour)초입니다.")
    }
}
