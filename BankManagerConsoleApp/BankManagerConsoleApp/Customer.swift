//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/08/03.
//

import Foundation

struct Customer {
    let totalNumber: Int
    
    init() {
        let range = (10...30)
        let totalNumber = Int.random(in: range)
        self.totalNumber = totalNumber
    }

    init(totalNumber: Int) {
        self.totalNumber = totalNumber
    }
}
