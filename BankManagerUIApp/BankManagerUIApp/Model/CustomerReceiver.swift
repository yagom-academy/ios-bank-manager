//
//  CustomerReceiver.swift
//  BankManagerConsoleApp
//
//  Created by 김성준 on 2023/03/14.
//

import Foundation

struct CustomerReceiver: Receivable {
    func receiveCustomer() -> Int {
        let customerRange: ClosedRange<Int> = 10...30
        let totalCustomer = Int.random(in: customerRange)
        return totalCustomer
    }
}

protocol Receivable {
    func receiveCustomer() -> Int
}
