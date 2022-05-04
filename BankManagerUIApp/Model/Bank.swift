//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

protocol BankDelegate: AnyObject {
    func bankWorkDidFinish(_ bank: Bank)
    func customerWorkDidStart(_ bank: Bank, id: String)
    func customerWorkDidFinish(_ bank: Bank, id: String)
}

final class Bank {
    private let waitingQueue = Queue<Customer>()
    private let loanWindow: BankWindow
    private let depositWindow: BankWindow
    private let loanQueue = OperationQueue()
    private let depositQueue = OperationQueue()
    private(set) var waitingNumber = 1
    private(set) var duration = 0.0
    weak var delegate: BankDelegate?
    let group = DispatchGroup()

    init(loanWindow: BankWindow, depositWindow: BankWindow) {
        self.loanWindow = loanWindow
        self.depositWindow = depositWindow
        self.loanWindow.delegate = self
        self.depositWindow.delegate = self
        
        loanQueue.maxConcurrentOperationCount = 1
        depositQueue.maxConcurrentOperationCount = 2
    }

    func open() {
        duration = checkTime(target: sendCustomerToClerk)
        reset()
    }

    func add(customers: [Customer]) {
        waitingNumber += customers.count
        
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
        while let customer = waitingQueue.dequeue() {
            waitingNumber += 1
            
            group.enter()
            switch customer.workType {
            case .loan:
                loanQueue.addOperation {
                    self.loanWindow.receive(customer)
                    self.group.leave()
                }
            case .deposit:
                depositQueue.addOperation {
                    self.depositWindow.receive(customer)
                    self.group.leave()
                }
            }
            
        }
        
        group.notify(queue: .main) {
            self.delegate?.bankWorkDidFinish(self)
        }
    }

    private func reset() {
        duration = 0.0
    }
}

extension Bank: BankWindowDelegate {
    func customerWorkDidStart(_ bankWindow: BankWindow, customer: Customer) {
        delegate?.customerWorkDidStart(self, id: customer.id)
    }

    func customerWorkDidFinish(_ bankWindow: BankWindow, customer: Customer) {
        delegate?.customerWorkDidFinish(self, id: customer.id)
    }
}
