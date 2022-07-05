//
//  Business.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/07/04.
//

import Foundation

enum Business: String {
    case deposit = "예금"
    case loan = "대출"
    
    var name: String {
        rawValue
    }
    
    var processTime: TimeInterval {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
