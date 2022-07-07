//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/06.
//

enum Task: CaseIterable {
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
    
    var workTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
