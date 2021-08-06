//
//  BankingTask.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/30.
//

import Foundation

enum BankingCategory: CaseIterable {
    case invalidTask
    case loan
    case deposit
    
    var timeRequired: Double {
        switch self {
        case .invalidTask:
            return 0.0
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
    
    static var randomTask: BankingCategory {
        return Self.allCases.randomElement() ?? .invalidTask
    }
}
