//
//  Banking.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/09.
//

enum Banking: CaseIterable, CustomStringConvertible {
    case deposit
    case loan
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var time: Double {
        switch self {
        case .deposit:
            return ManagerOption.processingTimeAtDeposit
        case .loan:
            return ManagerOption.processingTimeAtLoan
        }
    }
}
