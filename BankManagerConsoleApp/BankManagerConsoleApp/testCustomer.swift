//
//  testCustomer.swift
//  BankManagerConsoleApp
//
//  Created by 기원우 on 2021/05/02.
//

import Foundation

class TestCustomer {
    let waitNumber: Int
    let tier: Tier
    let kind: Kind
    
    init(number: Int, tier: Tier, kind: Kind) {
        self.waitNumber = number
        self.tier = tier
        self.kind = kind
    }
}

enum Tier: CaseIterable {
    case vvip
    case vip
    case normal
    
}

enum Kind: CaseIterable {
    case 예금
    case 대출
}

