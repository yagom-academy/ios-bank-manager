//
//  BankingTask.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/30.
//

import Foundation

enum BankingCategory: CaseIterable, CustomStringConvertible {
    case loan
    case deposit
    
    var timeRequired: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
    
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
    
    static var randomTask: BankingCategory {
        return Self.allCases.randomElement() ?? .deposit
    }
}
