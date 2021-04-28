//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/27.
//

import Foundation

protocol Bank {
    var ticketNumber: Int { get set }
    mutating func getNewTicket() -> Int
    mutating func resetTicketNumber()
}

extension Bank {
    mutating func getNewTicket() -> Int {
        ticketNumber += 1
        return ticketNumber
    }
    
    func formatTimeDuration(time: CFAbsoluteTime) -> String {
        let timeDuration = time
        return String(format: "%.2f", timeDuration)
    }
    
    mutating func closeBank(spentTime: CFAbsoluteTime) {
        let spentTime = formatTimeDuration(time: spentTime)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(ticketNumber)명이며, 총 업무시간은 \(spentTime)초입니다.")
        resetTicketNumber()
    }
    
    mutating func resetTicketNumber() {
        ticketNumber = 0
    }
}
