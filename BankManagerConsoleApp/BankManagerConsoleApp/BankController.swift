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

    func receiveCustomer(number: Int) {
        for _ in 0..<number {
            bank.customerQueue.enqueue(Bank.Customer(waitingNumber: customerWaitingCount))
            customerWaitingCount += 1
        }
    }

    func prepareTeller(number: Int) {
        for index in 0..<number {
            bank.counters.append(Bank.Teller(counterNumber: index))
        }
    }

    func openBank(customerNumber: Int, tellerNumber: Int) {
        openTime = ProcessInfo.processInfo.systemUptime
        receiveCustomer(number: customerNumber)
        prepareTeller(number: tellerNumber)
        bank.customerQueue.dequeue()?.go(to: bank.counters[0],
                                         by: bank.notificationBoard)
    }

    func closeBank() {}
}
