//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by 허윤영 on 02/05/2022.
//

import Foundation

enum BankService: CaseIterable {
    case deposit
    case loan
}

extension BankService {
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var requiredTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}

extension BankService {
    static var generateRandomBankService: BankService {
        guard let bankService = self.allCases.randomElement() else {
            return .deposit
        }
        return bankService
    }
}
