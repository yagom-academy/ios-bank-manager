//
//  BankManager.swift
//  Created by Yun, Ryan.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    // MARK: - Properties
    private var bank: Bank
    
    init(numberOfTeller: Int = 1) {
        self.bank = Bank(numberOfTeller: numberOfTeller)
    }
    
    // MARK: - NameSpaces
    private enum Menu {
        static let text: String = "1: 은행 개점\n2: 종료\n입력: "
        static let openBank: String = "1"
        static let exit: String = "2"
    }
    
    // MARK: - Private Methods
    private func selectMenu() throws -> String {
        print(Menu.text, terminator: "")
        guard let userInputText: String = readLine() else {
            throw BankManagerError.invalidMenu
        }
        return userInputText
    }
    
    mutating private func move(to selectedMenu: String) {
        switch selectedMenu {
        case Menu.openBank:
            bank.open()
        case Menu.exit:
            exit(0)
        default:
            print("유효하지 않은 입력입니다. 1과 2 중에서 선택해주세요.")
        }
    }
    
    mutating func start() {
        while true {
            do {
                let selectedMenu: String = try selectMenu()
                move(to: selectedMenu)
            } catch {
                print(error)
            }
        }
    }
}

