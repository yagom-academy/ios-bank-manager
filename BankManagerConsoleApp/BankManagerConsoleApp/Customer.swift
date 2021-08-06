//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by KimJaeYoun on 2021/08/05.
//

import Foundation

enum BusinessType: CaseIterable, CustomStringConvertible {
    case deposit
    case loan

    var workingTime: Double {
        switch self {
        case .deposit:
            return 3
        case .loan:
            return 5
        }
    }
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}

struct Customer {
    let numberTicket: Int
    let business: BusinessType
}
