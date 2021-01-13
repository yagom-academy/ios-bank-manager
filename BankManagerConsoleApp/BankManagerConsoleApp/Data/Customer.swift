//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

struct Customer {
    let waitingNumber: Int
    let grade: Grade
    let taskType: TaskType
    
    enum Grade: CaseIterable {
        case VVIP
        case VIP
        case normal
        
        var priority: Int {
            switch self {
            case .VVIP:
                return 0
            case .VIP:
                return 1
            case .normal:
                return 2
            }
        }
    }
    
    enum TaskType: CaseIterable {
        case loan
        case deposit
        
        var time: Double {
            switch self {
            case .loan:
                return 1.1
            case .deposit:
                return 0.7
            }
        }
    }
    
    init(waitingNumber: Int) throws {
        guard let randomGrade = Grade.allCases.randomElement(),
              let randomTask = TaskType.allCases.randomElement() else {
            throw BankError.typeRandomElement
        }
        self.waitingNumber = waitingNumber
        grade = randomGrade
        taskType = randomTask
    }
}

extension Customer.Grade: CustomStringConvertible {
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

extension Customer.TaskType: CustomStringConvertible {
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
}
