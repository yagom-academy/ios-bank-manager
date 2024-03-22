//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

var shouldRun:Bool = true

while shouldRun {
    print("1 : 은행개점")
    print("2 : 종료")
    print("입력 : ", terminator: " ")
    
    guard let input = readLine(), let choice = Int(input) else {
        print("아무것도 입력되지 않았습니다!")
        continue
    }
    
    switch choice {
    case 1:
        var bankManager = BankManager()
        bankManager.openBank()
    case 2:
        print("프로그램을 종료합니다")
        shouldRun = false
    default:
        print("잘못된 입력입니다. 1 또는 2를 입력해주세요.")
    }
}
