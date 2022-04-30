//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol BankDelegate: AnyObject {
    func bankWorkDidFinish(count: Int, hour: String)
}

final class Bank {
    private let waitingQueue = Queue<Customer>()
    private let loanWindow: BankWindow
    private let depositWindow: BankWindow
    private var handledCustomerCount = 0
    private var startTime = 0.0
    private var endTime = 0.0
    weak var delegate: BankDelegate?

    private var businessHours: String {
        let difference = endTime - startTime
        let flooredDifference = floor(difference * 10) / 10
        return String(format: "%.2f", flooredDifference)
    }

    init(loanWindow: BankWindow, depositWindow: BankWindow) {
        self.loanWindow = loanWindow
        self.depositWindow = depositWindow
    }

    func open() {
        sendCustomerToClerk()
        delegate?.bankWorkDidFinish(count: handledCustomerCount, hour: businessHours)
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
            loanWindow.receive(customer)
        }

        endTime = CFAbsoluteTimeGetCurrent()
    }

    private func reset() {
        handledCustomerCount = 0
    }
}
