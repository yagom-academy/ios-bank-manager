//
//  Business.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/09.
//

enum Business: CaseIterable {
    case loan
    case deposit
    
    var processtime: Double {
        switch self {
        case .loan:
            return 0.7
        case .deposit:
            return 1.1
        }
    }
}
