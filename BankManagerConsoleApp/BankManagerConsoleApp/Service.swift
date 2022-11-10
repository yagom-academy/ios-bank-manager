//
//  Service.swift
//  BankManagerConsoleApp
//
//  Created by jin on 11/10/22.
//

enum Service: CaseIterable {
    case deposit
    case loan
    
    var message: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
