//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

struct Bank {
    private let waitingQueue = Queue<Customer>()
    private let clerk = BankClerk()
    private var handledCustomerCount = 0
    private var startTime = 0.0
    private var endTime = 0.0

    private var businessHours: String {
        let difference = endTime - startTime
        let flooredDifference = floor(difference * 10) / 10
        return String(format: "%.2f", flooredDifference)
    }

    private func makeCustomers() {
        let customerCount = Int.random(in: 10...30)
        for number in 1...customerCount {
            waitingQueue.enqueue(Customer(waitingNumber: number))
        }
    }

    private mutating func sendCustomerToClerk() {
        startTime = CFAbsoluteTimeGetCurrent()

        while !waitingQueue.isEmpty {
            guard let customer = waitingQueue.dequeue() else { return }
            handledCustomerCount += 1
            clerk.work(for: customer)
        }

        endTime = CFAbsoluteTimeGetCurrent()
    }
}
