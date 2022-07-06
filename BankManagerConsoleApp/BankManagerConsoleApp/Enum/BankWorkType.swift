//
//  Time.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/07/01.
//

enum BankWorkType: CaseIterable {
    case deposit
    case loan
    
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var semaphoreValue: Int {
        switch self {
        case .deposit:
            return 2
        case .loan:
            return 1
        }
    }
    
    var processingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
