//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

struct Customer {
    private(set) var queueNumber: Int?
    private let task: BankTask

    init(queueNumber: Int? = nil, task: BankTask) {
        self.queueNumber = queueNumber
        self.task = task
    }

    mutating func receiveQueueNumber(queueNumber: Int) {
        self.queueNumber = queueNumber
    }
}
