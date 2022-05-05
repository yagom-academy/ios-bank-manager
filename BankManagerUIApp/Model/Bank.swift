//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

private enum Const {
    static let numberOfDepositClerk = 2
    static let numberOfLoanClerk = 1
}

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
    weak var delegate: BankDelegate?
    private let group = DispatchGroup()

    init(loanWindow: BankWindow, depositWindow: BankWindow) {
        self.loanWindow = loanWindow
        self.depositWindow = depositWindow
        
        loanQueue.maxConcurrentOperationCount = Const.numberOfLoanClerk
        depositQueue.maxConcurrentOperationCount = Const.numberOfDepositClerk
    }

    func add(customers: [Customer]) {
        waitingNumber += customers.count
        
        customers.forEach { customer in
            waitingQueue.enqueue(customer)
        }
        
        sendCustomerToWindow()
    }

    private func sendCustomerToWindow() {
        while let customer = waitingQueue.dequeue() {
            waitingNumber += 1
            
            group.enter()
            switch customer.workType {
            case .loan:
                loanQueue.addOperation {
                    self.loanWindow.receive {
                        self.delegate?.customerWorkDidStart(self, id: customer.id)
                    } end: {
                        self.delegate?.customerWorkDidFinish(self, id: customer.id)
                    }

                    self.group.leave()
                }
            case .deposit:
                depositQueue.addOperation {
                    self.depositWindow.receive {
                        self.delegate?.customerWorkDidStart(self, id: customer.id)
                    } end: {
                        self.delegate?.customerWorkDidFinish(self, id: customer.id)
                    }

                    self.group.leave()
                }
            }
        }
        
        group.notify(queue: .main) {
            self.delegate?.bankWorkDidFinish(self)
        }
    }

    func reset() {
        waitingNumber = 1
    }
}
