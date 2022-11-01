//
//  BankManagerConsolAppTests.swift
//  BankManagerConsolAppTests
//
//  Created by Gundy, jpush on 2022/11/01.
//

import XCTest

class BankManagerConsoleAppTests: XCTestCase {
    func test_when_generate_then_not_nil() {
        // given
        let queue: BankCustomerQueue
        
        // when
        queue = BankCustomerQueue()
        
        // then
        XCTAssertNotNil(queue)
    }

    func test_when_enqueue_then_not_empty() {
        // given
        var queue = BankCustomerQueue()
        
        // when
        queue.enqueue("일이삼")
        queue.enqueue(123)

        // then
        XCTAssertFalse(queue.isEmpty())
    }
    
    func test_when_dequeue_then_return_valid_value() {
        // given
        let data = "steven"
        var queue = BankCustomerQueue()

        // when
        queue.enqueue(data)
        let result = queue.dequeue()
        
        // then
        XCTAssertEqual(result as? String, data)
    }

    func test_when_peek_then_return_valid_value() {
        // given
        let data = "steven"
        var queue = BankCustomerQueue()

        // when
        queue.enqueue(data)
        let result = queue.peek()
        
        // then
        XCTAssertEqual(result as? String, data)
    }

    func test_when_clear_then_is_empty() {
        // given
        let data = "steven"
        var queue = BankCustomerQueue()
        queue.enqueue(data)
        
        // when
        queue.clear()

        // then
        XCTAssertTrue(queue.isEmpty())
    }
    
    func test_when_nothing_then_is_empty() {
        // given
        let queue = BankCustomerQueue()
        
        // when
        
        // then
        XCTAssertTrue(queue.isEmpty())
    }
}
