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
            print("1: 은행 개점\n2: 종료\n입력: ", terminator: "")
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
