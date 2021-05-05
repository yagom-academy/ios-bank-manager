//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by TORI on 2021/05/04.
//

import Foundation

enum ClientType: Int, CaseIterable, Comparable {
    case vvip = 0
    case vip = 1
    case normal = 2
    
    static func < (lhs: ClientType, rhs: ClientType) -> Bool {
        if (lhs == .normal && rhs == .vip)
        || (lhs == .normal && rhs == .vvip)
        || (lhs == .vip && rhs == .vvip) {
            return true
        } else {
            return false
        }
    }
}

enum BusinessType: Double, CaseIterable {
    case deposit = 0.7
    case loan = 1.1
}

struct Client {
    let waitingNumber: UInt
    let clientClass: ClientType
    let businessType: BusinessType
}
