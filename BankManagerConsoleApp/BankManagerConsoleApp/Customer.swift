//
//  CustomerManager.swift
//  BankManagerConsoleApp
//
//  Created by 기원우 on 2021/04/27.
//

import Foundation

struct Customer {
    let waitNumber: Int
    let tier: Tier
    let business: Business
    
}

enum Tier: Int, CaseIterable {
    case vvip = 0
    case vip = 1
    case normal = 2
}

enum Business: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
}

extension Tier {
    var tierName: String {
        switch self {
        case .vvip:
            return "vvip"
        case .vip:
            return "vip"
        default:
            return "일반"
        }
    }
}
