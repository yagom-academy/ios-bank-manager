//
//  BankManager.swift
//  Created by Yun, Ryan.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    // MARK: - Properties
    private var bank: Bank
    
    init(numberOfTeller: Int) {
        self.bank = Bank(numberOfTeller: numberOfTeller)
    }
    
    // MARK: - NameSpaces
    private enum Menu {
        static let text: String = "1: 은행 개점\n2: 종료\n입력: "
        static let openBank: String = "1"
        static let exit: String = "2"
    }
    
    // MARK: - Private Methods
    func menuText() -> String {
        return Menu.text
    }
    
    private func selectMenu() throws -> String {
        guard let userInputText: String = readLine() else {
            throw BankManagerError.invalidMenu
        }
        return userInputText
    }
    
    mutating func start() {
        while true {
            do {
                let menuText: String = menuText()
                print(menuText, terminator: "")
                let selectedMenu: String = try selectMenu()
                
                switch selectedMenu {
                case Menu.openBank:
                    bank.open()
                case Menu.exit:
                    return
                default:
                    print("유효하지 않은 입력입니다. 1과 2 중에서 선택해주세요.")
                }
            } catch {
                print(error)
            }
        }
    }
}

