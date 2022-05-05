//
//  BankManager.swift
//  BankManagerUIApp
//
//  Created by 박세웅 on 2022/05/05.
//

import Foundation

struct BankManager {
    private let customerRange: ClosedRange = 10...10
    var bank: Bank = Bank(numberOfCustomer: 0)

    mutating func startBanking() {
        setUpBank()
        bank.work()
    }

    private mutating func setUpBank() {
        bank.setUpCustomer(number: generateRandomNumber(in: customerRange))
    }

    private func generateRandomNumber(in range: ClosedRange<Int>) -> Int {
        return Int.random(in: range)
    }
}
