//  Task.swift
//  BankManagerConsoleApp
//  Created by Baem & Bella on 2022/11/07.

enum Task: String {
    case deposit = "예금"
    case loan = "대출"
    
    var front: Int {
        switch self {
        case .deposit:
            return 2
        case .loan:
            return 1
        }
    }
}
