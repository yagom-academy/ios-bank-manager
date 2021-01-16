//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Menu: String {
    case start = "1"
    case exit = "2"
}

while true {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
    guard let input = readLine(), let menu = Menu(rawValue: input) else {
        print("잘못된 입력입니다.")
        continue
    }
    if menu == .exit {
        break
    }
    let bankManager = BankManager(bankerCount: 3, customerCount: 10)
    bankManager.openBank()
}

