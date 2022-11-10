//
//  BankBusiness.swift
//  BankManagerConsoleApp
//
//  Created by junho,woong on 2022/11/10.
//

import Foundation

enum BankBusiness: CaseIterable {
    case deposit
    case loan
    
    var processingTimePerCustomer: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
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
