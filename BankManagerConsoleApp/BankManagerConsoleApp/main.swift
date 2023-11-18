//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

let bank: Bank = .init(bankClerkCount: 1)

func start() {
    print("""
    1 : 은행개점
    2 : 종료
    입력
    """, terminator: " : ")
    
    let userInput = readLine()
    
    switch userInput {
    case "1":
        bank.open()
        start()
    case "2":
        exit(0)
    default:
        print("다시 입력해주세요")
        start()
    }
}

start()

