//
//  BusinessType.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BeakGom on 2022/07/05.
//

enum BusinessType: CaseIterable {
    case deposit
    case loan
    
    var bankingName: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var bankingProcessingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
