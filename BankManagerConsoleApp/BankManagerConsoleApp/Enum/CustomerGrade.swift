//
//  CustomerGrade.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/03.
//

import Foundation

enum CustomerGrade: CaseIterable {
    case vvip
    case vip
    case basic
    
    var name: String {
        switch self {
        case .vvip:
            return "VVIP"
        case .vip:
            return "VIP"
        case .basic:
            return "일반"
        }
    }
    
    var queuePriority: Operation.QueuePriority {
        switch self {
        case .vvip:
            return Operation.QueuePriority.veryHigh
        case .vip:
            return Operation.QueuePriority.normal
        case .basic:
            return Operation.QueuePriority.veryLow
        }
    }
    
    static var random: CustomerGrade {
        guard let randomGrade = CustomerGrade.allCases.randomElement() else {
            return CustomerGrade.basic
        }
        return randomGrade
    }
}
