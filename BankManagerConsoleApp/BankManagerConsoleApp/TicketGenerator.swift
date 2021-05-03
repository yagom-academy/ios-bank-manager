//
//  TicketGenerator.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/05/03.
//

import Foundation

struct TicketGenerator {
    static var ticketNumber: Int = 0
    
    static func getNewTicketNumber() -> Int {
        ticketNumber += 1
        return ticketNumber
    }
    
    static func resetTicketNumberToZero() {
        ticketNumber = 0
        return
    }
}
