//
//  Customer.swift
//  BankManagerUIApp
//
//  Created by 박세웅 on 2022/05/05.
//

import Foundation

struct Customer {
    let number: Int
    let bankingType: BankingTask?

    init(_ number: Int) {
        self.number = number
        self.bankingType = BankingTask.allCases.randomElement()
    }
}
