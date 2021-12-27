//
//  Message.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/23.
//

import Foundation

enum StarterMessage: String, CustomStringConvertible {
    case open = "1 : 은행 개점\n2 : 종료\n입력 : "
    
    var description: String {
        self.rawValue
    }
}
