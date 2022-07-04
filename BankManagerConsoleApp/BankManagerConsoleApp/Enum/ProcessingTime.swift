//
//  Time.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/07/01.
//

enum ProcessingTime {
    case general
    
    var workTime: Double {
        switch self {
        case .general:
            return 0.7
        }
    }
}
