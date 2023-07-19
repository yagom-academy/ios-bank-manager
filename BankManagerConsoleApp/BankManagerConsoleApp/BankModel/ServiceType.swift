//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by yyss99, 비모 on 2023/07/17.
//

enum ServiceType: CaseIterable {
    case deposit
    case loan
    
    var workTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var defaultNumberOfClerk: Int {
        switch self {
        case .deposit:
            return 2
        case .loan:
            return 1
        }
    }
}
