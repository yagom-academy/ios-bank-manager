//
//  TaskType.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/29.
//

import Foundation

enum TaskCategory {
    case defaultTask
    
    func getTaskTime() -> TimeInterval {
        switch self {
        case .defaultTask:
            return 0.7
        }
    }
}
