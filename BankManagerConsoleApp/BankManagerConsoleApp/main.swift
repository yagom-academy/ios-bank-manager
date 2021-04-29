//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let bankManager = BankManager(numberOfTeller: 1)

func start() {
    while true {
        print("""
                1 : 은행개점
                2 : 종료
                입력 :
                """, terminator: " ")
        guard let userInputText = readLine() else {
            print("잘못된 입력입니다. 다시 입력해주세요.")
            continue
        }
        switch userInputText {
        case "1":
            bankManager.generateNumberOfClient()
            bankManager.sendToCounter()
        case "2":
            return
        default:
            print("잘못된 입력입니다. 1과 2번중에 선택하여 입력해주세요.")
        }
    }
}

start()
