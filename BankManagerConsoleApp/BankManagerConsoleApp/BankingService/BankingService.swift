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

enum BankingService: BankingServiceProtocol {
    case loan
    case deposit
    
    var name: String {
        switch self {
        case .loan:
            return "대출"
        case .deposit:
            return "예금"
        }
    }
    
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
