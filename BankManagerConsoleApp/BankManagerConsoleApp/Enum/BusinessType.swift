//
//  BysinessType.swift
//  BankManagerConsoleApp
//
//  Created by unchain, BeakGom on 2022/07/05.
//

enum BusinessType {
    case deposit
    case loan
    
    var bankingName: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
