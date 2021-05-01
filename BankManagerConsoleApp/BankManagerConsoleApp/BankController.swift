//
//  BankController.swift
//  BankManagerConsoleApp
//
//  Created by musun129 on 2021/04/30.
//

import Foundation

class BankController {
    let bank: Bank
    var openTime: TimeInterval?
    var closeTime: TimeInterval?
    var businessHours: TimeInterval?
    var customerWaitingCount: Int = 0

    init(of bank: Bank) {
        self.bank = bank
    }

    func receiveCustomer(number: Int) {}

    func prepareTeller(number: Int) {}

    func openBank() {}

    func closeBank() {}
}
