//
//  BankService.swift
//  BankManagerConsoleApp

enum BankService: CaseIterable {
    case deposit
    case loan
    
    var timePerService: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
