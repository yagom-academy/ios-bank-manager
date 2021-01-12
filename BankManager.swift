//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let queue: DispatchQueue
    let second: Double = 1_000_000
    private let tellerNumber: Int
    private(set) var state: State
    private var timeNeedToFinishTask: TimeInterval = 0.7

    init(number: Int) {
        self.tellerNumber = number
        self.state = .notWorking
        self.queue = DispatchQueue.init(label: "\(number)")
    }
    
    mutating func performTask(customer: Customer, semaphore: DispatchSemaphore) {
        self.state = .working
        switch customer.taskType {
        case .loan:
            checkLoanDocument(customer: customer)
            requestLoanApproval(customer: customer)
            implementLoanTask(customer: customer)
        default:
            implementDepositTask(customer: customer)
        }
        self.state = .notWorking
        semaphore.signal()
    }
    
    private func checkLoanDocument(customer: Customer) {
        print("\(BankManagerMessage.start)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
        usleep(useconds_t(BankTask.documentCheck.timeForTask * second))
    }
    
    private func requestLoanApproval(customer: Customer) {
        BankHeadquarter.shared.approveLoanTask(customer: customer)
    }
    
    private func implementLoanTask(customer: Customer) {
        usleep(useconds_t(BankTask.loanImplement.timeForTask * second))
        print("\(BankManangerMessage.end)".format(customer.waitNumber, customer.priority.description, BankTask.loanImplement.rawValue))
    }
    
    private func implementDepositTask(customer: Customer) {
        print("\(BankManagerMessage.start)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
        usleep(useconds_t(customer.taskType.timeForTask * second))
        print("\(BankManagerMessage.end)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
    }
    
    enum State {
        case working
        case notWorking
    }
}
