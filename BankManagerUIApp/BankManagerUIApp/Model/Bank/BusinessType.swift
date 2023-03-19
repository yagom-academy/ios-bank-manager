//
//  BusinessType.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/09.
//

enum BusinessType: String, CaseIterable {
    case loan = "대출"
    case deposit = "예금"
    
    var consultingTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}
