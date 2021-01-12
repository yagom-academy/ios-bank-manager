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
        let second: Double = 1_000_000
        self.state = .working
        print("\(BankManangerMessage.start)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
        usleep(useconds_t(customer.taskType.timeForTask * second))
        print("\(BankManangerMessage.end)".format(customer.waitNumber, customer.priority.description, customer.taskType.rawValue))
        self.state = .notWorking
        semaphore.signal()
    }
    
    enum State {
        case working
        case notWorking
    }
}
