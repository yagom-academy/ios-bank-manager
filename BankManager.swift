//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    let queue: DispatchQueue
    private let tellerNumber: Int
    private(set) var state: BankManagerState
    private var timeNeedToFinishTask: TimeInterval = 0.7

    init(number: Int) {
        self.tellerNumber = number
        self.state = .notWorking
        self.queue = DispatchQueue.init(label: "\(number)")
    }
    
    mutating func performTask(customer: Customer, semaphore: DispatchSemaphore) {
        switch customer.taskType {
        case .loan:
            timeNeedToFinishTask = customer.taskType.timeForTask
        default:
            timeNeedToFinishTask = customer.taskType.timeForTask
        }
        let second: Double = 1_000_000
        self.state = .working
        print("\(BankManangerMessage.start)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
        usleep(useconds_t(timeNeedToFinishTask * second))
        print("\(BankManangerMessage.end)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
        self.state = .notWorking
        semaphore.signal()
    }
}
