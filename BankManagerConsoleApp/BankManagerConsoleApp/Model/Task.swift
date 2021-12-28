//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by user on 2021/12/28.
//

import Foundation

enum Task: CustomStringConvertible {
    case deposit
    case loan
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var processingTime: Double {
        switch self {
        case .deposit:
            return 1.1
        case .loan:
            return 0.7
        }
    }
}

extension Task: CaseIterable {
    static func createRandomTask() -> Self {
        guard let task = Self.allCases.randomElement() else {
            fatalError()
        }
        return task
    }
}
