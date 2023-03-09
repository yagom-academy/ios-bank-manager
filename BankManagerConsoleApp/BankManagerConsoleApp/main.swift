//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



menuMessage()
while let inputNumber = readLine() {
    let bankManager = BankManager()
    
    if inputNumber == "2" {
        print("종료")
        break
    } else if inputNumber == "1" {
        let customerCount = Int.random(in: 10...30)
        bankManager.bankCustomer = customerCount
        bankManager.manageBanking()
        menuMessage()
    } else {
        print("입력이 잘못 되었습니다.")
        menuMessage()
    }
}


func menuMessage() {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
}
