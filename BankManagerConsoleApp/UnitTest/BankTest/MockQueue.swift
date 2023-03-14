//
//  MockQueue.swift
//  BankTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest

class MockQueue: Queue<Customer> {
    var enqueueCount: Int = 0
    var dequeueCount: Int = 0
    var dummyCustomer: Customer?
    
    override func enqueue(_ data: Customer) {
        enqueueCount += 1
    }
    
    override func dequeue() -> Customer? {
        dequeueCount += 1
        return nil
    }
    
}
