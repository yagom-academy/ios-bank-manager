//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

private enum MenuOption: Int {
    case bankOpen = 1
    case exit
}

struct BankManager {
    private var bank = Bank()
    
    mutating func start() {
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
              let userNumber = Int(userInput),
              let userSelection = MenuOption(rawValue: userNumber) else { return nil }
        
        return userSelection
    }
}

