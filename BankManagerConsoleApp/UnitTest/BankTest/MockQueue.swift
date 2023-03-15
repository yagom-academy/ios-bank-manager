//
//  MockQueue.swift
//  BankTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest

class MockQueue: CustomerQueueable {
    var list: LinkedList<Customer> = LinkedList()
    
    var enqueueCount: Int = 0
    var dequeueCount: Int = 0
    var dummyCustomer: Customer?
    
    func enqueue(_ data: Customer) {
        list.append(data: data)
        enqueueCount += 1
    }
    
    func dequeue() -> Customer? {
        dequeueCount += 1
        return list.removeFirst()
    }
    
}
