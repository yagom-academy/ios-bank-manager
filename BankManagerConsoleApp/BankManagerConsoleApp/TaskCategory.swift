//
//  TaskType.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/29.
//

import Foundation

enum TaskCategory: CaseIterable {
    case deposit
    case loan
    
    var taskTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    static var randomElement: TaskCategory {
        guard let randomTask = TaskCategory.allCases.randomElement() else {
            return .deposit
        }
        return randomTask
    }
}
