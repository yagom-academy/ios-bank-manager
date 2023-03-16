//
//  Business.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/09.
//

enum Business: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"
    
    var processTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
