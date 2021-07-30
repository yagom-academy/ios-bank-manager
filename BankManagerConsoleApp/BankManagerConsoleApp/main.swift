//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var needContinue = true
let bankManager = BankManager()

while needContinue {
    print("1 : 은행개졈")
    print("2 : 종료")
    print("입력 : ", terminator: "")
    guard let userInput = readLine(),
          let inputNumber = Int(userInput),
          inputNumber == 1 || inputNumber == 2 else {
        continue
    }
    if inputNumber == 2 {
        break
    }
    bankManager.runBank()
}
