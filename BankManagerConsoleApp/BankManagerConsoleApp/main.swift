//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

let bankManager = BankManager(numberOfBankClerk: 1)

while true {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: "")
    
    guard let inputString = readLine() else {
        break
    }
    
    guard let inputInt = Int(inputString),
          let menu = BankMenu(rawValue: inputInt) else {
        continue
    }
    
    switch menu {
    case .commence:
        bankManager.commenceBanking()
    case .exit:
        exit(0)
    }
}
