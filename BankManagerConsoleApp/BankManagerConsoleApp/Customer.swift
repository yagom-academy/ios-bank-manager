//
//  CustomerManager.swift
//  BankManagerConsoleApp
//
//  Created by 기원우 on 2021/04/27.
//

import Foundation

class Customer {
    private let _waitNumber: Int
    private let _tier: Tier
    private let _business: Business
    
    var waitNumber: Int { return _waitNumber }
    var tier: Tier { return _tier }
    var business: Business { return _business }
    
    init(_waitNumber: Int, _tier: Tier, _business: Business) {
        self._waitNumber = _waitNumber
        self._tier = _tier
        self._business = _business
    }
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
