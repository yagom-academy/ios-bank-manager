//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

struct Customer {
    let waitNumber: Int
    let priority: Priority
    let taskType: Task
    
    init(waitNumber: Int, priority: Priority, taskType: Task) {
        self.waitNumber = waitNumber
        self.priority = priority
        self.taskType = taskType
    }
    
    enum Priority: String, CaseIterable {
        case VVIP = "0"
        case VIP = "1"
        case normal = "2"
        
        var description: String {
            switch self {
            case .VVIP:
                return "VVIP"
            case .VIP:
                return "VIP"
            case .normal:
                return "일반"
            }
        }
    }

    enum Task: String, CaseIterable {
        case loan = "대출업무"
        case deposit = "예금업무"
        
        var timeForTask: Double {
            switch self {
            case .loan:
                return 1.1
            case .deposit:
                return 0.7
            }
        }
    }
}
