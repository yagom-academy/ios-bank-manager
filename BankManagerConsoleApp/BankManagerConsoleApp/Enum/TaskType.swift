//
//  TaskType.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/11.
//

import Foundation

enum TaskType: CaseIterable {
    case loan
    case deposit
    
    var taskTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
    
    var taskString: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
}
