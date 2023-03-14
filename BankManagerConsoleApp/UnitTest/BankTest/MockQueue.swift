//
//  MockQueue.swift
//  BankTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import XCTest

class MockQueue: Queueable {

    typealias T = Int
    
    var count: Int = 0
    
    func enqueue(_ data: Int) {
        count += 1
    }
    
    func dequeue() -> Int? {
        count -= 1
        return count
    }
    
}
