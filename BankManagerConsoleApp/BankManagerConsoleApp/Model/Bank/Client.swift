//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Zion, Whales on 2023/07/12.
//

struct Client {
    enum BankingType: String, CaseIterable {
        case deposit = "예금"
        case loan = "대출"
        
        var taskTime: Double {
            switch self {
            case .deposit:
                return 0.7
            case .loan:
                return 1.1
            }
        }
    }
    
    let turn: Int
    let banking: BankingType
    
    init(_ turn: Int, _ bankingType: BankingType) {
        self.turn = turn
        self.banking = bankingType
    }
}
