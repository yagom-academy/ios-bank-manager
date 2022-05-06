//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/05/03.
//

import Foundation

enum Task: String, CaseIterable {
    case deposit = "예금"
    case loan = "대출"
    
    static var random: Self? {
        return Self.allCases.randomElement()
    }
    
    var time: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
