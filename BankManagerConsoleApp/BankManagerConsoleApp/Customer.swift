//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/08/05.
//

import Foundation

enum BusinessType: CaseIterable {
    case deposit
    case loan

    var workingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}

struct Customer {
    let numberTicket: Int
    let business: BusinessType
}
