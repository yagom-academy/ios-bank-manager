//
//  BusinessType.swift
//  BankManagerConsoleApp
//
//  Created by yun on 2021/08/05.
//

import Foundation

enum BusinessType: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
    
    var getName: String {
        return self.rawValue
    }
    
    var processingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}

