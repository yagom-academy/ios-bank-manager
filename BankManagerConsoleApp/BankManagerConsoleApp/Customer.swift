//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/13.
//

struct Customer {
    private(set) var queueNumber: Int?
    
    mutating func receiveQueueNumber(queueNumber: Int) {
        self.queueNumber = queueNumber
    }
}
