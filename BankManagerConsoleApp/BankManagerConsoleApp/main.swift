//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum BankManagement{
    static let manager = BankManager()
    static let openBank = 1
    static let closeBank = 2
}

func startBankManage() {
    let userInput = receiveUserInput()
    if userInput == BankManagement.closeBank {
        return
    }
    BankManagement.manager.runBank()
    return startBankManage()
}

func receiveUserInput() -> Int {
    print("1 : 은행개졈")
    print("2 : 종료")
    print("입력 : ", terminator: "")
    guard let userInput = readLine(),
          let inputNumber = Int(userInput),
          inputNumber == BankManagement.openBank || inputNumber == BankManagement.closeBank
    else {
        print("잘못 입력하셨습니다. 다시 입력해주세요.")
        return receiveUserInput()
    }
    return inputNumber
}

startBankManage()
