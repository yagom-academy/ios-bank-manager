//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    private let tellerNumber: Int
    private(set) var state: BankManagerState
    private var timeNeedToFinishTask: Double = 0.7

    init(number: Int) {
        self.tellerNumber = number
        self.state = .notWorking
    }
    
    mutating func performTask(customerNumber: Int, customerPriority: CustomerPriority, customerTask: CustomerTask) {
        switch customerTask {
        case .loan:
            timeNeedToFinishTask = customerTask.timeForTask
        default:
            timeNeedToFinishTask = customerTask.timeForTask
        }
        let second: Double = 1_000_000
        self.state = .working
        print("\(BankManangerMessage.start)".format(customerNumber, customerPriority.description, customerTask.rawValue))
        usleep(useconds_t(timeNeedToFinishTask * second))
        print("\(BankManangerMessage.end)".format(customerNumber, customerPriority.description, customerTask.rawValue))
        self.state = .notWorking
    }
}
