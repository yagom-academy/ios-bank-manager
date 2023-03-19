//
//  Business.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/12.
//

enum Business: CaseIterable, CustomStringConvertible {
    case deposit
    case loan
    
    var time: Double {
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
