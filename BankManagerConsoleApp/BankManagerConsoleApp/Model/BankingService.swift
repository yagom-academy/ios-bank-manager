//
//  BankingService.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/17.
//

enum BankingService: CaseIterable {
    case deposit
    case loan
    
    var duration: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
}

extension BankingService: CustomStringConvertible {
    var description: String {
        switch self {
        case .deposit:
            return "예금 업무"
        case .loan:
            return "대출 업무"
        }
    }
}
