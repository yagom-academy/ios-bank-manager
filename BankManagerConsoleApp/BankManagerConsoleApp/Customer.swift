//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/09.
//

import Foundation

struct Customer {
    let waitingNumber: Int
    let customerClass: Class
    let task: TaskType
    
    enum Class: CaseIterable, Comparable {
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
    
    init(waitingNumber: Int, customerClass: Class, customerTask: TaskType) {
        self.waitingNumber = waitingNumber
        self.customerClass = customerClass
        self.task = customerTask
    }
}

extension Customer: Comparable {
    static func < (lhs: Customer, rhs: Customer) -> Bool {
        return lhs.customerClass < rhs.customerClass
    }
}
