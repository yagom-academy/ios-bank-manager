//
//  BankManager.swift
//  Created by Yun, Ryan.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank
    
    init(numberOfTeller: Int = 1) {
        self.bank = Bank(numberOfTeller: numberOfTeller)
    }
    
    private enum Menu {
        static let text: String = "1: 은행 개점\n2: 종료\n입력: "
        static let openBank: Int = 1
        static let exit: Int = 2
    }
    
    private func selectMenu() throws -> Int {
        print(Menu.text, terminator: "")
        let userInput: String? = readLine()
        guard let userInputText: String = userInput,
              let userInputNumber: Int = Int(userInputText) else {
            throw BankManagerError.invalidMenu("\"\(userInput ?? "nil")\"")
        }
        return userInputNumber
    }
    
    mutating private func move(to selectedMenu: Int) {
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
                let selectedMenu: Int = try selectMenu()
                move(to: selectedMenu)
            } catch {
                print(error)
            }
        }
    }
}

