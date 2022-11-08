//
//  BankWork.swift
//  BankManagerConsoleApp
//
//  Created by 노유빈 on 2022/11/08.
//

import Foundation

enum BankWork {
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
    
    var time: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
