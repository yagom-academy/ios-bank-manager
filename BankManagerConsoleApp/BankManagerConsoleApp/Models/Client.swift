//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

struct Client {
    enum Purpose: CaseIterable {
        case deposit
        case loan

        var name: String {
            switch self {
            case.deposit:
                return "예금"
            case .loan:
                return "대출"
            }
        }
    }
    
    let waitingTicket: Int
    let purpose: Purpose
}
