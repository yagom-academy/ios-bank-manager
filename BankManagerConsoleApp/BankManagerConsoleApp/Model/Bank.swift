//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

class Bank {
    private let waitingQueue = Queue<Customer>()
    private let window: BankWindow
    private var handledCustomerCount = 0
    private var startTime = 0.0
    private var endTime = 0.0
    var delegate: BankResultDelegate?

    private var businessHours: String {
        let difference = endTime - startTime
        let flooredDifference = floor(difference * 10) / 10
        return String(format: "%.2f", flooredDifference)
    }

    init(window: BankWindow) {
        self.window = window
    }

    func open() {
        sendCustomerToClerk()
        delegate?.printBankResult(count: handledCustomerCount, hour: businessHours)
        reset()
    }

    func add(customers: [Customer]) {
        customers.forEach { customer in
            waitingQueue.enqueue(customer)
        }
    }

    private func sendCustomerToClerk() {
        startTime = CFAbsoluteTimeGetCurrent()

        while !waitingQueue.isEmpty {
            guard let customer = waitingQueue.dequeue() else { return }
            handledCustomerCount += 1
            window.work(for: customer)
        }

        endTime = CFAbsoluteTimeGetCurrent()
    }

    private func reset() {
        handledCustomerCount = 0
    }
}
