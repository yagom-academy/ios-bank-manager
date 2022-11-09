//
//  BankingType.swift
//  Created by sunnycookie, inho
//

import Foundation

enum BankingType: CaseIterable {
    case deposit
    case loan
    
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
