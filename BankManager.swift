//
//  BankManager.swift
//  Created by Yun, Ryan.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    // MARK: - Properties
    private var bank: LocalBank
    
    init(numberOfTeller: Int) {
        self.bank = LocalBank(numberOfTeller: numberOfTeller)
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
    
    mutating func move(to selectedMenu: String) -> Bool {
        switch selectedMenu {
        case Menu.openBank:
            return true
        case Menu.exit:
            return false
        default:
            print("유효하지 않은 입력입니다. 1과 2 중에서 선택해주세요.")
            return false
        }
    }
    
    mutating func start() {
        while true {
            do {
                let printMenu: String = menuText()
                print(printMenu, terminator: "")
                let selectedMenu: String = try selectMenu()
                let shouldOpenBank: Bool = move(to: selectedMenu)
                
                if shouldOpenBank {
                    bank.open()
                } else {
                    return
                }
            } catch {
                print(error)
            }
        }
    }
}

