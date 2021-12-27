//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by 예거 on 2021/12/23.
//

import Foundation

enum Task: String, CaseIterable {
    
    case deposit = "예금"
    case loan = "대출"
    
    static var random: Self {
        Self.allCases.randomElement() ?? .deposit
    }
    
    private var duration: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    func work() {
        switch self {
        case .deposit:
            Thread.sleep(forTimeInterval: Task.deposit.duration)
        case .loan:
            Thread.sleep(forTimeInterval: Task.loan.duration)
        }
    }
}
