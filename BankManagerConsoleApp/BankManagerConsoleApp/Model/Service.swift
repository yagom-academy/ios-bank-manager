//
//  Service.swift
//  BankManagerConsoleApp
//
//  Created by 재재, 나별 on 2022/07/05.
//

enum Service: CaseIterable {
    case deposit
    case loan
    
    var estimatedTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var serviceName: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
}
