//
//  BankManagerConsoleApp - main.swift
//  Created by kaki, songjun. 
//  Copyright © yagom academy. All rights reserved.
// 

var bankManager = BankManager()

while true {
    print("1 : 은행개점\n2 : 종료")
    print("입력 : ", terminator: "")
    guard let userInput = readLine() else { break }
    
    if userInput == "1" {
        bankManager.setupWaitingQueueAndClientNumber()
        bankManager.processBusiness()
    } else if userInput == "2" {
        break
    } else {
        print("잘못된 입력입니다. 다시 입력해주세요.")
    }
}
