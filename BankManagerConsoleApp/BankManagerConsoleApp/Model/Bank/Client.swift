//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Zion, Whales on 2023/07/12.
//

struct Client {
    let turn: Int
    let banking: BankingType
    
    init(_ turn: Int, _ bankingType: BankingType) {
        self.turn = turn
        self.banking = bankingType
    }
}
