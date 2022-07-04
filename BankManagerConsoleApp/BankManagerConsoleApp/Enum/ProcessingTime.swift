//
//  Time.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/07/01.
//

enum ProcessingTime {
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
}
