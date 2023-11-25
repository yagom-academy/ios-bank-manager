//
//  BankingCategory.swift
//
//
//  Created by Kiseok on 11/22/23.
//

enum BankingCategory: UInt64, CaseIterable {
    case deposit = 700_000_000
    case loan = 1_100_000_000
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
