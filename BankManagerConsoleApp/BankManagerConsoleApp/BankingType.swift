//
//  BankingType.swift
//  Created by sunnycookie, inho
//

import Foundation

enum BankingType: Int {
    case deposit = 1
    case loan = 2
    
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
