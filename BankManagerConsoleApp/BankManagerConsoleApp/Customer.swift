//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/09.
//

import Foundation

struct Customer {
    let waitingNumber: Int
    let grade: Grade
    let task: TaskType
    
    enum Grade: CaseIterable, Comparable {
        case VVIP
        case VIP
        case normal
        
        var description: String {
            switch self {
            case .VVIP:
                return "VVIP 고객"
            case .VIP:
                return "VIP 고객"
            case .normal:
                return "일반 고객"
            }
        }
    }
}

extension Customer: Comparable {
    static func < (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.grade < rhs.grade
    }
}
