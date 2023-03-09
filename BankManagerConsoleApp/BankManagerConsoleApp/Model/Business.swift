//
//  Business.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/09.
//

enum Business: CaseIterable {
    case loan
    case deposit
    
    var processTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
