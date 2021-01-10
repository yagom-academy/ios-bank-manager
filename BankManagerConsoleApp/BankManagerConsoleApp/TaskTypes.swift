//
//  taskTypes.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/09.
//

import Foundation

enum TaskType: useconds_t, CaseIterable {
    case deposit = 700000
    case loan = 1100000
    
    var description: String {
        switch self {
        case .deposit:
            return " 예금"
        case .loan:
            return " 대출"
        }
    }
}
