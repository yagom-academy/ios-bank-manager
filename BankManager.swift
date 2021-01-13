//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let queue: DispatchQueue
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
            requestLoanApprovalToHeadquarter(customer: customer)
            implementLoanTask(customer: customer)
        default:
            implementDepositTask(customer: customer)
        }
        self.state = .notWorking
        semaphore.signal()
    }
    
    private func checkLoanDocument(customer: Customer) {
        print("\(BankManagerMessage.start)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
        usleep(useconds_t(BankManager.Task.documentCheck.timeForTask * Time.second.rawValue))
    }
    
    private func requestLoanApprovalToHeadquarter(customer: Customer) {
        BankHeadquarter.shared.approveLoanTask(customer: customer)
    }
    
    private func implementLoanTask(customer: Customer) {
        usleep(useconds_t(BankManager.Task.loanImplement.timeForTask * Time.second.rawValue))
        print("\(BankManagerMessage.end)".format(customer.waitNumber, customer.priority.description, BankManager.Task.loanImplement.rawValue))
    }
    
    private func implementDepositTask(customer: Customer) {
        print("\(BankManagerMessage.start)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
        usleep(useconds_t(customer.taskType.timeForTask * Time.second.rawValue))
        print("\(BankManagerMessage.end)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
    }
    
    enum State {
        case working
        case notWorking
    }
    
    enum Task: String {
        case documentCheck
        case loanImplement = "대출업무"
        
        var timeForTask: TimeInterval {
            switch self {
            case .loanImplement:
                return 0.3
            case .documentCheck:
                return 0.3
            }
        }
    }
}
