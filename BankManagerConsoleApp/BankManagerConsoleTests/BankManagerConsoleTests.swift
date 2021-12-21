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

    func test_shoud_isEmptyisFalse_When_enqueue3AsParam() {
        queue.enqueue(3)
        XCTAssertFalse(queue.isEmpty)
    }
    
    func test_should_returnValueis1_When_dequeue() {
        queue.enqueue(1)
        let returnValue = queue.dequeue()
        XCTAssertEqual(returnValue, 1)
    }
}
