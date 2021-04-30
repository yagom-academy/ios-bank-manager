//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank: Bank
    
    init(numberOfTeller: Int = 1) {
        self.bank = Bank(numberOfTeller)
    }
    
    private enum Menu {
        static let text: String = "1: 은행 개점\n2: 종료\n입력: "
        static let openBank: Int = 1
        static let closeBank: Int = 2
    }
    
    private func selectMenu() throws -> Int {
        print(Menu.text, terminator: "")
        guard let userInput: String = readLine(),
              let userInputNumber: Int = Int(userInput) else {
            throw BankManagerError.invalidMenu(#function)
        }
        return userInputNumber
    }
    
    mutating func start() {
        while true {
            do {
                switch try selectMenu() {
                case Menu.openBank:
                    bank.open()
                case Menu.closeBank:
                    return
                default:
                    print("유효하지 않은 입력입니다.")
                }
            } catch {
                print(error)
            }
        }
    }
}

