//  BankManagerConsoleApp - BankingService.swift
//  Created by Ayaan/Dragon/som on 2022/11/02.
//  Copyright © yagom academy. All rights reserved.

import Foundation

protocol BankingServiceProtocol {
    var processTime: Double { get }
    
    func request()
}

extension BankingServiceProtocol {
    func request() {
        Thread.sleep(forTimeInterval: processTime)
    }
}

enum BankingService: String, BankingServiceProtocol {
    case loan = "대출"
    case deposit = "예금"
    
    var processTime: Double {
        switch self {
        case .loan:
            return 1.1
        case .deposit:
            return 0.7
        }
    }
}

extension BankingService: CaseIterable {
    static func random() -> BankingService? {
        return BankingService.allCases.shuffled().first
    }
}
