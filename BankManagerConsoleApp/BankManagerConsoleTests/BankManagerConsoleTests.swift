//
//  BankManagerConsoleTests.swift
//  BankManagerConsoleTests
//
//  Created by 1 on 2021/12/21.
//

import XCTest

class BankManagerConsoleTests: XCTestCase {
    var queue: Queue<Int> = Queue<Int>()

    override func tearDownWithError() throws {
     queue = Queue<Int>()
    }

    func test_Should_isEmptyIsFalse_When_enqueue3() {
        queue.enqueue(3)
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_Should_returnValueIs1_When_dequeue() {
        queue.enqueue(1)
        let returnValue = queue.dequeue()
        XCTAssertEqual(returnValue, 1)
    }
    
    func test_Should_returnValueIs1_When_peek() {
        queue.enqueue(1)
        let returnValue = queue.peek()
        XCTAssertEqual(returnValue, 1)
    }
    
    func test_Should_isEmptyIsTrue_When_clear() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        queue.clear()
        XCTAssertTrue(queue.isEmpty)
    }
}
