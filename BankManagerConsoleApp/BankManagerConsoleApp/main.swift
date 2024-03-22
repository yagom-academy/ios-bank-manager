//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

var userInput: String = ""
var flag: Bool = true

while flag {
    bankStart()
}

func bankStart() {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
    guard let userInput = readLine() else {
        return
    }
    
    switch userInput {
    case "1":
        print("테스트")
        // commenceBanking()
    case "2":
        flag = false
    default:
        flag = true
    }
}



