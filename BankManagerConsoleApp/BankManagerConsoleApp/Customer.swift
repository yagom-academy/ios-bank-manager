//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 이성노 on 2021/05/05.
//

import Foundation

enum CustomerPriority: CaseIterable {
    case VVIP
    case VIP
    case normal
        
    var tier: String {
        switch self {
        case .VVIP:
            return "VVIP"
        case .VIP:
            return "VIP"
        case .normal:
            return "일반"
        }
    }
        
    var queuePriority: Operation.QueuePriority {
        switch self{
        case .VVIP:
            return Operation.QueuePriority.veryHigh
        case .VIP:
            return Operation.QueuePriority.normal
        case .normal:
            return Operation.QueuePriority.veryLow
        }
    }

    static var random: CustomerPriority {
        guard let randomGrade = CustomerPriority.allCases.randomElement() else {
            return CustomerPriority.normal
        }
        return randomGrade
    }
}
    
enum TaskType: CaseIterable {
    case deposit
    case loan
    
    var purpose: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var taskTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    static var random: TaskType {
        guard let randomTaskType = TaskType.allCases.randomElement() else {
            return TaskType.deposit
        }
        return randomTaskType
    }
}

