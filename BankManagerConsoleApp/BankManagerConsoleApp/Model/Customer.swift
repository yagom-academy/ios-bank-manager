//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/23.
//

import Foundation

struct Customer {
    var turn: Int
    var task: Task
    
    init(turn: Int) {
        self.turn = turn
        self.task = Task.createRandomTask()
    }
}
