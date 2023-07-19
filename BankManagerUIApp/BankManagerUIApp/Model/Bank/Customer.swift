//
//  Customer.swift
//  BankManagerUIApp
//
//  Created by minsong kim on 2023/07/19.
//

import Foundation

struct Customer {
    let numberTicket: Int
    var bankTask: BankTask {
        guard let bankTask = BankTask.allCases.randomElement() else {
            return .deposit
        }

        return bankTask
    }
}
