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

enum Tier: String, CaseIterable {
    case vvip = "vvip"
    case vip = "vip"
    case normal = "일반"
}

enum Business: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
}
