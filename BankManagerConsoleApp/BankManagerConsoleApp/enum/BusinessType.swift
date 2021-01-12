//
//  BusinessType.swift
//  BankManagerConsoleApp
//
//  Created by 리나 on 2021/01/12.
//

import Foundation

enum BusinessType: CaseIterable, CustomStringConvertible {
    case deposit
    case loan
    
    var neededTime: TimeInterval {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 0.3
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
