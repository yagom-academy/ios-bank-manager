//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

fileprivate extension Double {
    var formattedTime: String {
        let difference = floor(self * 10) / 10
        return String(format: "%.2f", difference)
    }
}

protocol BankDelegate: AnyObject {
    func bankWorkDidFinish(count: Int, hour: String)
}

final class Bank {
    private let waitingQueue = Queue<Customer>()
    private let loanWindow: BankWindow
    private let depositWindow: BankWindow
    private var handledCustomerCount = 0
    weak var delegate: BankDelegate?

    init(loanWindow: BankWindow, depositWindow: BankWindow) {
        self.loanWindow = loanWindow
        self.depositWindow = depositWindow
    }

    func open() {
        let duration = checkTime(target: sendCustomerToClerk)
        delegate?.bankWorkDidFinish(count: handledCustomerCount, hour: duration.formattedTime)
        reset()
    }

    func add(customers: [Customer]) {
        customers.forEach { customer in
            waitingQueue.enqueue(customer)
        }
    }

    private func checkTime(target: () -> Void) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        target()
        let endTime = CFAbsoluteTimeGetCurrent()
        return (endTime - startTime)
    }

    private func sendCustomerToClerk() {
        let group = DispatchGroup()
        let depositSemaphore = DispatchSemaphore(value: 2)
        let loanSemaphore = DispatchSemaphore(value: 1)

        while !waitingQueue.isEmpty {
            guard let customer = waitingQueue.dequeue() else { return }

            switch customer.workType {
            case .loan:
                loanSemaphore.wait()
            case .deposit:
                depositSemaphore.wait()
            }

            DispatchQueue.global().async(group: group) {
                switch customer.workType {
                case .loan:
                    self.loanWindow.receive(customer)
                    loanSemaphore.signal()
                case .deposit:
                    self.depositWindow.receive(customer)
                    depositSemaphore.signal()
                }
            }

            handledCustomerCount += 1
        }

        group.wait()
    }

    private func reset() {
        handledCustomerCount = 0
    }
}
