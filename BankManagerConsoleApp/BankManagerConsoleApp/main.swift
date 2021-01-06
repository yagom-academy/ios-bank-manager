//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

while true {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
    let input = readLine()
    guard input == "1" || input == "2" else {
        print("잘못된 입력입니다.")
        continue
    }
    if input == "2" {
        break
    }
    let customerCount = UInt.random(in: 10...30)
    let bankManager = BankManager(bankerCount: 1, customerCount: customerCount)
    bankManager.openBank()
}


