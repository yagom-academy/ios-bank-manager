//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

struct Client {
    var ticketNumber: Int?
    
    mutating func getWaitingNumberTicket(at bank: Bank) {
        self.ticketNumber = bank.returnTicketNumber()
    }
}
