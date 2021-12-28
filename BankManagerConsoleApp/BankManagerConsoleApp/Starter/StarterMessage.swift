//
//  Message.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/23.
//

import Foundation

enum StarterMessage: CustomStringConvertible {
    case open
    
    var description: String {
        switch self {
        case .open:
            return "1 : 은행 개점\n2 : 종료\n입력 : "
        }
    }
}
