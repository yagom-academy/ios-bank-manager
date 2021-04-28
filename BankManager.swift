//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private var bank = Bank(teller: Teller())
    
    private enum Option {
        static let openBank = 1
        static let closeBank = 2
    }
    
    mutating func start() {
        while true {
            print("시작: 1, 종료: 2")
            guard let userInput: String = readLine(),
                  let userInputNumber: Int = Int(userInput) else { return }
            
            switch userInputNumber {
            case Option.openBank:
                bank.open()
            case Option.closeBank:
                return
            default:
                print("유효하지 않은 입력입니다.")
            }
        }
    }
}
