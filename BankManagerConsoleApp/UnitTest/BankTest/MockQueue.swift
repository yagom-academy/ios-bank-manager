//
//  MockQueue.swift
//  BankTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest

class MockQueue: Queue<Customer> {
    var enqueueCount: Int = 0
    var dequeueCount: Int { self.enqueueCount }
    var dummyCustomer: DummyCustomer?
    
    override func enqueue(_ data: DummyCustomer) {
        self.dummyCustomer = data
        enqueueCount += 1
    }
    
    override func dequeue() -> DummyCustomer? {
        dequeueCount += 1
        return self.dummyCustomer
    }
    
}
