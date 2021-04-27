//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    func start() {
        print("시작: 1, 종료: 2")
        guard let userInput: String = readLine(),
              let userInputNumber: Int = Int(userInput) else {
            return
        }
        switch userInputNumber {
        case 1:
            print("은행개점")
        case 2:
            print("종료")
            return
        default:
            print("유효하지 않은 입력입니다.")
        }
    }
}
