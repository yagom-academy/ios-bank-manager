//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/08/04.
//

import Foundation

enum TaskType: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
    
    var workingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    static var random: TaskType {
        guard let random = TaskType.allCases.randomElement() else {
            return .deposit
        }
        return random
    }
}
