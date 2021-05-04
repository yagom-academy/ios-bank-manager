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

enum workType: CustomStringConvertible {
    case deposit
    case loanReview
    case loanEvaluation
    case loanExecution
    
    var duration: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loanReview:
            return 0.3
        case .loanEvaluation:
            return 0.5
        case .loanExecution:
            return 0.3
        }
    }
    
    var description: String {
        switch self {
        case .deposit:
            return "예금업무"
        case .loanReview:
            return "대출업무 시작"
        case .loanEvaluation:
            return "대출심사"
        case .loanExecution:
            return "대출업무 완료"
        }
    }
}
