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
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var numberOfBankClerk: Int {
        switch self {
        case .deposit:
            return 2
        case .loan:
            return 1
        }
    }
}
