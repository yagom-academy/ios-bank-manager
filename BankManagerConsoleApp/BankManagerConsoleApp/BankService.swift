//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by JeongTaek Han on 2021/12/28.
//

import Foundation

enum BankService: CaseIterable {
    
    case deposit
    case loan
    
    var processingTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
    
    var koreanDescription: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var englishDescription: String {
        switch self {
        case .deposit:
            return "deposit"
        case .loan:
            return "loan"
        }
    }
    
    static func selectRandom() -> BankService {
        let serviceIndex = Int.random(in: BankService.allCases.indices)
        let service = BankService.allCases[serviceIndex]
        return service
    }
}
