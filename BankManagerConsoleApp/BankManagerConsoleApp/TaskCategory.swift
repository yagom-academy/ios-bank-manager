//
//  TaskType.swift
//  BankManagerConsoleApp
//
//  Created by Jost, Hosinging on 2021/07/29.
//

import Foundation

enum TaskCategory {
    case defaultTask
    
    var getTaskTime: Double {
        switch self {
        case .defaultTask:
            return 0.7
        }
    }
}
