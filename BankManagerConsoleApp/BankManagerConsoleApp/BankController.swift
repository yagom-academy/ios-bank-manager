//
//  BankController.swift
//  BankManagerConsoleApp
//
//  Created by musun129 on 2021/04/30.
//

import Foundation

class BankController {
    private let bank: Bank
    private var openTime: TimeInterval?
    private var closeTime: TimeInterval?
    private var businessHours: TimeInterval? {
        guard let boundOpenTime = openTime, let boundCloseTime = closeTime else { return nil }

        return (boundCloseTime - boundOpenTime)
    }
    private var customerWaitingCount: Int = 0

    init(of bank: Bank) {
        self.bank = bank
    }

    func receiveCustomer(number: Int) {}

    func prepareTeller(number: Int) {}

    func openBank() {}

    func closeBank() {}
}
