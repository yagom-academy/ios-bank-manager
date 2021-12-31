//
//  BankWorkType.swift
//  BankManagerConsoleApp
//
//  Created by 권나영 on 2021/12/29.
//

import Foundation

enum BankWork: CaseIterable {
    case deposit
    case loan
    
    var koreanDescription: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var requiredTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
