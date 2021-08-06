//
//  Work.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/08/05.
//

import Foundation

enum BusinessCategory: UInt {
    case deposit = 1
    case loan = 2
    var time: UInt32 {
        switch self {
        case .deposit:
            return 700000
        case .loan:
            return 1100000
        }
    }
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
