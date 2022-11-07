//
//  BankService.swift
//  BankManagerConsoleApp

enum BankService: CaseIterable {
    case deposit
    case loan
    
    var timePerTask: UInt32 {
        switch self {
        case .deposit:
            return 700000
        case .loan:
            return 1100000
        }
    }
}
