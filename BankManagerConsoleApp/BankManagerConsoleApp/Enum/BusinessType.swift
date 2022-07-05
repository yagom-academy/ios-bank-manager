//
//  BysinessType.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BeakGom on 2022/07/05.
//

enum BusinessType {
    case deposit
    case loan
    
    var type: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
