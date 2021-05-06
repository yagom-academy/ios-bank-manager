//
//  BankTaskType.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/03.
//

import Foundation

enum BankTaskType: CaseIterable {
    case deposit
    case loan
    
    var taskTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 0.3
        }
    }
    
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    static var random: BankTaskType {
        guard let randomTaskType = BankTaskType.allCases.randomElement() else {
            return BankTaskType.deposit
        }
        return randomTaskType
    }
}
