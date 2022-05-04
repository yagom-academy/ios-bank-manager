//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

enum WorkType: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"
    
    var delayTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
    
    var description: String {
        return self.rawValue
    }
}
