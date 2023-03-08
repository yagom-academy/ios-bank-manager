//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

print("1 : 은행개점")
print("2 : 종료")
print("입력 : ", terminator: "")
let inputNumber = readLine()!
let bankManager = BankManager()

if inputNumber == "1" {
    let customer = Int.random(in: 10...30)
    bankManager.bankCustomers = customer
    bankManager.doBanking()
} else if inputNumber == "2" {
    
} else {
    print("입력이 잘못 되었습니다.")
}
