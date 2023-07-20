//
//  BankingType.swift
//  BankManagerConsoleApp
//
//  Created by Hyungmin Lee on 2023/07/20.
//

enum BankingType: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"
    
    var taskTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
