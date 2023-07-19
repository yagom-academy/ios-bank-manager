//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/18.
//

enum BankTask: CaseIterable {
    case deposit
    case loans
    
    var time: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loans:
            return 1.1
        }
    }
    
    var korean: String {
        switch self {
        case .deposit:
            return "예금"
        case .loans:
            return "대출"
        }
    }
}
