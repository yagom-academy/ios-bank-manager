//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

struct Client {
    let ticketNumber: Int
}

extension Client: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.ticketNumber == rhs.ticketNumber
    }
}
