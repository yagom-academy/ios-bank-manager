//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/10.
//
import Foundation

enum Task: Int {
    case deposit = 1
    case loan
    
    
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
