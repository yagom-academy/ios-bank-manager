//
//  BankManagerConsoleApp - main.swift
//  Created by brody, christy, harry. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var isSelectedOpen = true

while isSelectedOpen {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
    guard let userInput = readLine() else {
        continue
    }
    
    switch userInput {
    case "1":
        let bank = Bank(bankersCount: 1)
        bank.open()
    case "2":
        isSelectedOpen = false
    default:
        print()
        continue
    }
}
