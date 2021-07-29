//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func inputUserCommand() -> Bool {
    while true {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
        if let str = readLine(),
           str == "1" || str == "2" {
            return str == "1"
        }
    }
}

// MARK: --- main Program
while true {
    guard inputUserCommand() else { break }
    
}
