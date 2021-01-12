//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

struct Customer {
    let waitNumber: Int
    let priority: CustomerPriority
    let taskType: CustomerTask
    
    init(waitNumber: Int, priority: CustomerPriority, taskType: CustomerTask) {
        self.waitNumber = waitNumber
        self.priority = priority
        self.taskType = taskType
    }
}
