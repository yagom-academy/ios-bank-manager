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
    func getTimeDuration() -> String
    mutating func closeBank()
    mutating func resetTicketNumber()
}

extension Bank {
    mutating func getNewTicket() -> Int {
        ticketNumber += 1
        return ticketNumber
    }
    
    func getTimeDuration() -> String {
        let timeDuration = Double(ticketNumber) * 0.7
        return String(format: "%.2f", timeDuration)
    }
    
    mutating func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(ticketNumber)명이며, 총 업무시간은 \(getTimeDuration())초입니다.")
        resetTicketNumber()
    }
    
    mutating func resetTicketNumber() {
        ticketNumber = 0
    }
}
