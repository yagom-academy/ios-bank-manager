//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/27.
//

import Foundation

struct Bank {
    private var ticketNumber: Int = 0
    private(set) var numberOfBankTeller: Int
    private var openTime: CFAbsoluteTime?
    private var closeTime: CFAbsoluteTime?
    
    init(numberOfBankTeller: Int) {
        self.numberOfBankTeller = numberOfBankTeller
    }
    
    mutating func getNewTicketNumber() -> Int {
        ticketNumber += 1
        return ticketNumber
    }
    
    mutating func openBank() {
        openTime = CFAbsoluteTimeGetCurrent()
    }
    
    mutating func closeBank() throws {
        closeTime = CFAbsoluteTimeGetCurrent()
        
        guard let open = openTime,
              let close = closeTime else { throw BankManagerError.failToCaclulateSpentTime }
        
        let spentTime = formatTimeDuration(time: close - open)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(ticketNumber)명이며, 총 업무시간은 \(spentTime)초입니다.")
        setTicketNumberToZero()
    }
    
    mutating private func setTicketNumberToZero() {
        ticketNumber = 0
    }
    
    private func formatTimeDuration(time: CFAbsoluteTime) -> String {
        let timeDuration = time
        return String(format: "%.2f", timeDuration)
    }
}
