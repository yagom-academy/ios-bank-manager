//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by JeongTaek Han on 2021/12/23.
//

import Foundation

struct Customer {
    
    let turn: Int
    let task: BankService
    
    init(turn: Int) {
        self.turn = turn
        self.task = BankService.selectRandom()
    }
}
