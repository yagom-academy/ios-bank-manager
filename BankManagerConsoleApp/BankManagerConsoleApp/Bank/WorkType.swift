//
//  WorkType.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/14.
//

enum WorkType: CaseIterable {
    case loan, deposit
    
    var taskTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
    
    var numberOfBankClerk: Int {
        switch self {
        case .loan:
            return 1
        case .deposit:
            return 2
        }
    }
    
    var name: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
}
