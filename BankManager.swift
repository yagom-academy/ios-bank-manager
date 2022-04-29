//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

private enum MenuOption: String {
    case bankOpen = "1"
    case exit = "2"
}

struct BankManager {
    private let bank = Bank(window: BankCommonWindow())

    func start() {
        printMenu()
        
        switch inputUserOption() {
        case .bankOpen:
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

