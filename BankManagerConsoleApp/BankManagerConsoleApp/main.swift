//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func openBank() {
    var bankManager = BankManager(BankHeadOffice.shared, 3, Int.random(in: 10...30))
    bankManager.doBusiness()
}

var isContinue = true

while isContinue {
    print("1 : 은행개점 \n2 : 종료\n입력 : ", terminator: "")

    guard let input = readLine(), let inputNumber = Int(input) else {
        print("다시 입력하세요")
        continue
    }
    
    switch inputNumber {
    case 1:
        openBank()
    case 2:
        isContinue = false
    default:
        print("유효한 숫자를 입력하세요")
        continue
    }
}
