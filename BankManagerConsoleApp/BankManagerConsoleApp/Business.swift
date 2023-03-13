//
//  Business.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/12.
//

enum Business: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
    
    var time: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
