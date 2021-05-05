//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 이성노 on 2021/05/05.
//

import Foundation

struct Customer {
    var waitingNumber: Int
    var grade: CustomerPriority
    var visitPurpose: TaskType
    
    init(waitingNumber: Int, grade: CustomerPriority, visitPurpose: TaskType) {
        self.waitingNumber = waitingNumber
        self.grade = grade
        self.visitPurpose = visitPurpose
    }
}

enum CustomerPriority {
    case VVIP
    case VIP
    case normal
}

enum TaskType {
    case deposit
    case loan
}
