//
//  Business.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/07/04.
//

import Foundation

enum Business {
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
    
    var processTime: TimeInterval {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}
