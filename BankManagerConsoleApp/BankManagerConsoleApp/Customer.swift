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

enum Tier: Comparable {
    case vvip
    case vip
    case normal
}

enum Business: Comparable {
    case deposit
    case loan
}
