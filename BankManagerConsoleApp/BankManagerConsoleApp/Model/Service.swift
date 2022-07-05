//
//  Service.swift
//  BankManagerConsoleApp
//
//  Created by Gordon Choi on 2022/07/05.
//

enum Service: CaseIterable {
    case deposit
    case loan
    
    var estimatedTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
