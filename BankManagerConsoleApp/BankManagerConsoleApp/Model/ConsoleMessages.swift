//
//  ConsoleMessages.swift
//  BankManagerConsoleApp
//
//  Created by Ellen on 2021/07/30.
//

import Foundation

enum MainMenuMessage {
    case firstSelection
    case secondSelection
    case userInput
    
    var description: String {
        switch self {
        case .firstSelection:
            return "1 : 은행개점"
        case .secondSelection:
            return "2 : 종료"
        case .userInput:
            return "입력 : "
        }
    }
}
