//
//  BankController.swift
//  BankManagerConsoleApp
//
//  Created by musun129 on 2021/04/30.
//

import Foundation

class BankController {
    private let bank: Bank
    private var customerWaitingCount: Int = 0
    private var openTime: TimeInterval?
    private var closeTime: TimeInterval?
    private var businessHours: TimeInterval? {
        guard let boundOpenTime = openTime, let boundCloseTime = closeTime else { return nil }

        return (boundCloseTime - boundOpenTime)
    }

    init(of bank: Bank, tellerNumber: Int) {
        self.bank = bank
        employTeller(number: tellerNumber)
        bank.notificationBoard.addObserver(bank.customerQueue)
    }

    func receiveCustomer(number: Int) {
        for _ in 0..<number {
            bank.customerQueue.enqueue(Bank.Customer(waitingNumber: customerWaitingCount))
            customerWaitingCount += 1
        }
    }

    func employTeller(number: Int) {
        for index in 0..<number {
            bank.counters.append(Bank.Teller(counterNumber: index))
        }
    }

    func reset() {
        openTime = nil
        closeTime = nil
        customerWaitingCount = 0
    }

    func openBank(customerNumber: Int) {
        openTime = ProcessInfo.processInfo.systemUptime
        receiveCustomer(number: customerNumber)

        for counter in bank.counters {
            bank.customerQueue.dequeue()?.go(to: counter, sender: bank.notificationBoard)
        }
    }

    func closeBank() {
        closeTime = ProcessInfo.processInfo.systemUptime
        let businessHoursText: String = businessHours?.description ?? "nil"

        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerWaitingCount)명이며, 총 업무시간은 \(businessHoursText)초입니다.")
        reset()
    }
}
