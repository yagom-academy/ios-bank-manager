//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by James,Fezz on 2021/04/30.
//

import Foundation

enum CreditRating: CaseIterable {
    case vvip, vip, normal
}

extension CreditRating: CustomStringConvertible {
    var description: String {
        switch self {
        case .vvip:
            return "VVIP"
        case .vip:
            return "VIP"
        case .normal:
            return "일반"
        }
    }
}

enum WorkType: CaseIterable {
    case deposit
    case loan
    
    enum LoanProcess {
        case loanEvaluation, loanExecution
        
        var duration: Double {
            switch self {
            case .loanEvaluation:
                return 0.5
            case .loanExecution:
                return 0.3
            }
        }
    }
    
    var duration: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}

extension WorkType: CustomStringConvertible {
    var description: String {
        switch self {
        case .deposit:
            return "예금업무"
        case .loan:
            return "대출업무"
        }
    }
}

extension WorkType.LoanProcess: CustomStringConvertible {
    var description: String {
        switch self {
        case .loanExecution:
            return "대출업무"
        case .loanEvaluation:
            return "대출심사"
        }
    }
}
