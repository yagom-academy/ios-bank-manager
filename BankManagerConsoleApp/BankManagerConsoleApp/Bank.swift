//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/27.
//

import Foundation

protocol Bankable {
    var numberOfBankTeller: Int { get }
    var openTime: CFAbsoluteTime? { get }
    var closeTime: CFAbsoluteTime? { get }
    
    mutating func openBank()
    mutating func closeBank(totalCustomerNumber: Int) throws
}

struct Bank: Bankable {
    private(set) var numberOfBankTeller: Int
    private(set) var openTime: CFAbsoluteTime?
    private(set) var closeTime: CFAbsoluteTime?
    
    init(numberOfBankTeller: Int) {
        self.numberOfBankTeller = numberOfBankTeller
    }
    
    mutating func openBank() {
        openTime = CFAbsoluteTimeGetCurrent()
    }
    
    mutating func closeBank(totalCustomerNumber: Int) throws {
        closeTime = CFAbsoluteTimeGetCurrent()
        let spentTime = try getSpentTime()
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerNumber)명이며, 총 업무시간은 \(spentTime)초입니다.")
    }
    
    private func getSpentTime() throws -> String {
        guard let open = openTime,
              let close = closeTime else {
            throw BankManagerError.failToCaclulateSpentTime
        }
        
        let spentTime = formatTimeDuration(time: close - open)
        return spentTime
    }
    
    private func formatTimeDuration(time: CFAbsoluteTime) -> String {
        let timeDuration = time
        return String(format: "%.2f", timeDuration)
    }
}

extension Bank {
    enum Task {
        case deposit
        case examineLoanDocument
        case judgementLoan
        case loan
        
        var time: useconds_t {
            switch self {
            case .deposit:
                return 1_100_000
            case .examineLoanDocument, .loan:
                return 300_000
            case .judgementLoan:
                return 500_000
            }
        }
    }
}
