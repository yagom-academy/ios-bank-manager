//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Command: String {
    case open = "1"
    case close = "2"
}

enum ConsoleError: Error {
    case wrongInput
    
    var errorMessage: String {
        switch self {
        case .wrongInput:
            return "⚠️ 잘못된 입력입니다. 1 또는 2를 입력해주세요.\n\n"
        }
    }
}

var isEnd = false
while(!isEnd) {
    printConsoleMessage()

    guard let input = readLine(),
          let command = Command(rawValue: input) else {
        print(ConsoleError.wrongInput.errorMessage)
        continue
    }
    
    switch command {
    case .open:
        BankManager().open()
    case .close:
        isEnd = true
    }
}

private func printConsoleMessage() {
    let startMessage = """
    1 : 은행개점
    2 : 종료
    """
    
    print(startMessage)
    print("입력 : ", terminator: "")
}
