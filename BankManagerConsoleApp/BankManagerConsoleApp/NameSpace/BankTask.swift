//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by 휴, 보리 on 2022/07/07.
//
enum BankTask: CustomStringConvertible {
    case loan
    case deposit
    
    var description: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
}
