//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/27.
//

import Foundation

protocol Bankable {
    var numberOfBankTeller: Int { get }
    
    mutating func openBank()
    mutating func closeBank(totalCustomerNumber: Int?) throws
}

struct Bank: Bankable {
    private(set) var numberOfBankTeller: Int
    private var openTime: CFAbsoluteTime?
    private var closeTime: CFAbsoluteTime?
    
    init(numberOfBankTeller: Int) {
        self.numberOfBankTeller = numberOfBankTeller
    }
    
    mutating func openBank() {
        openTime = CFAbsoluteTimeGetCurrent()
    }
    
    mutating func closeBank(totalCustomerNumber: Int?) throws {
        closeTime = CFAbsoluteTimeGetCurrent()
        let spentTime = try getSpentTime()
        
        guard let numberOfCustomers = totalCustomerNumber else {
            throw BankManagerError.failToGetTotalCustomerNumber
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfCustomers)명이며, 총 업무시간은 \(spentTime)초입니다.")
    }
    
    private func getSpentTime() throws -> String {
        guard let open = openTime,
              let close = closeTime else {
            throw BankManagerError.failToCaclulateSpentTime
        }
        
        let spentTime = formatTimeDuration(time: open - close)
        return spentTime
    }
    
    private func formatTimeDuration(time: CFAbsoluteTime) -> String {
        let timeDuration = time
        return String(format: "%.2f", timeDuration)
    }
}
