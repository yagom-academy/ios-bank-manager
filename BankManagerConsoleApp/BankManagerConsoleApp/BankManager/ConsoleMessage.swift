//
//  ConsoleMessage.swift
//  BankManagerConsoleApp
//
//  Created by 예거 on 2021/12/23.
//

import Foundation

enum ConsoleMessage {
    
    case open
    case exit
    
    static let invalidInput = "입력이 잘못되었습니다. 다시 입력해주세요."
    static let menu = "1 : 은행개점\n2 : 종료\n입력 : "
    var input: String {
        switch self {
        case .open:
            return "1"
        case .exit:
            return "2"
        }
    }
}
