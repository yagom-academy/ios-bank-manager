//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Goat,Andrew on 2023/03/14.
//

import Foundation

enum Customer: String, CaseIterable {
    case loan = "loan"
    case deposit = "deposit"
    
    var takenTimeForBanking: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var deskCount: Int {
        switch self {
        case .deposit:
            return 2
        case .loan:
            return 1
        }
    }
}



