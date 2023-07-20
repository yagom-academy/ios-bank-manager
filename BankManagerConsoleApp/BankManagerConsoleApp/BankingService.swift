//
//  BankingService.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/17.
//

enum BankingService: CaseIterable, CustomStringConvertible {
    case deposit
    case loans
    
    var processTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loans:
            return 1.1
        }
    }
    
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loans:
            return "대출"
        }
    }
}
