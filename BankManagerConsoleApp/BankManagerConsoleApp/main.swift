//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let startMessage = """
1 : 은행개점
2 : 종료
"""
var isEnd = false

while(!isEnd) {
    print(startMessage)
    print("입력 : ", terminator: "")

    guard let input = readLine() else { fatalError("유효하지 않은 입력입니다.") }

    // TODO: enum 1, 2
    switch input {
    case "1":
        BankManager().open()
    case "2":
        isEnd = true
    default:
        print("1 또는 2가 유효함.")
    }
}

