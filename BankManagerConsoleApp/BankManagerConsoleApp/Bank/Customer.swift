//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

struct Customer {
    private(set) var task: BankTask
    private(set) var queueNumber: Int?

    init(task: BankTask, queueNumber: Int? = nil) {
        self.task = task
        self.queueNumber = queueNumber
    }

    mutating func receiveQueueNumber(queueNumber: Int) {
        self.queueNumber = queueNumber
    }
}
