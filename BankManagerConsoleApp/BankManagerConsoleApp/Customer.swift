//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 김지혜 on 2021/01/13.
//

import Foundation

enum Level: CaseIterable, CustomStringConvertible {
    case vvip, vip, general
    
    var priority: Int {
        switch self {
        case .vvip:
            return 0
        case .vip:
            return 1
        case .general:
            return 2
        }
    }
    
    var description: String {
        switch self {
        case .vvip:
            return "VVIP"
        case .vip:
            return "VIP"
        case .general:
            return "일반"
        }
    }
}

enum Task: CaseIterable, CustomStringConvertible {
    case loan, deposit
    
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
    
    var processTime: Double {
        switch self {
        case .loan:
            return 0.7
        case .deposit:
            return 1.1
        }
    }
}

struct Customer {
    var number: Int
    var level: Level
    var task: Task
}
