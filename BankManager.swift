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
        case .대출:
            guard let timeNeedForLoan = Double(TimeNeedDependOnTask.대출.rawValue) else {
                return
            }
            timeNeedToFinishTask = timeNeedForLoan
        default:
            guard let timeNeedForDeposit = Double(TimeNeedDependOnTask.대출.rawValue) else {
                return
            }
            timeNeedToFinishTask = timeNeedForDeposit
        }
        let second: Double = 1_000_000
        let customerPriority = "\(customerPriority)"
        let customerTask = "\(customerTask)"
        self.state = .working
        print("\(BankManangerMessage.start)".format(customerNumber, customerPriority, customerTask))
        usleep(useconds_t(timeNeedToFinishTask * second))
        print("\(BankManangerMessage.end)".format(customerNumber, customerPriority, customerTask))
        self.state = .notWorking
    }
}
