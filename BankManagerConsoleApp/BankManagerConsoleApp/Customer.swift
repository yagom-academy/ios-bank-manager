//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/08/04.
//

import Foundation

struct Customer {
    let order: Int
    let task: Task
    
    init(_ order: Int) {
        self.task = Task.random()
        self.order = order
    }
}
