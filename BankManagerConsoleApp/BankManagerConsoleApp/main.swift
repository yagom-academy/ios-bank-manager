//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Decision: String {
    case excute = "1"
    case exit = "2"
}

func announceMessage() {
    print("1 : 은행개점\n2 : 종료")
    print("입력 : ", terminator: "")
}

func decideToStartProgram() -> Decision {
    while true {
        announceMessage()
        if let unwrappedString = readLine(),
           let decision = Decision.init(rawValue: unwrappedString) {
            return decision
        }
    }
}

// MARK: --- main Program
while true {
    guard decideToStartProgram() == .excute else { break }
    print("실행") // test code
}
print("종료") // test code
