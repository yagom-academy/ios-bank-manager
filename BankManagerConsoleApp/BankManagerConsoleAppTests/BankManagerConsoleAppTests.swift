//
//  BankManagerConsolAppTests.swift
//  BankManagerConsolAppTests
//
//  Created by Gundy, jpush on 2022/11/01.
//

import XCTest
import BankCustomerQueue

class BankManagerConsoleAppTests: XCTestCase {
    var sut: BankCustomerQueue<String> = BankCustomerQueue<String>()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = BankCustomerQueue<String>()
    }
    
    func test_when_generate_then_not_nil() {
        // given
        
        // when
        
        // then
        XCTAssertNotNil(sut)
    }

    func test_when_enqueue_then_not_empty() {
        // given
        
        // when
        sut.enqueue("일이삼")
        sut.enqueue("123")

        // then
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_when_dequeue_then_return_valid_value() {
        // given
        let data = "steven"

        // when
        sut.enqueue(data)
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, data)
    }

    func test_when_peek_then_return_valid_value() {
        // given
        let data = "steven"

        // when
        sut.enqueue(data)
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, data)
    }

    func test_when_clear_then_is_empty() {
        // given
        let data = "steven"
        sut.enqueue(data)
        
        // when
        sut.clear()

        // then
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_when_nothing_then_is_empty() {
        // given
        
        // when
        
        // then
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_when_enqueue_5_times_dequeue_5_times_then_return_valid_value() {
        // given
        let items: [String] = ["1", "이", "steven", "jpush", "햄버"]
        
        // when
        items.forEach {
            sut.enqueue($0)
        }
        
        // then
        for index in items.indices {
            let result = items[index]
            XCTAssertEqual(result, sut.dequeue())
        }
    }
    
    func test_when_dequeue_by_number_of_elements_then_is_empty() {
        // given
        let items: [String] = ["1", "이", "steven", "jpush", "햄버"]
        
        // when
        items.forEach {
            sut.enqueue($0)
        }
        
        items.indices.forEach { _ in
            sut.dequeue()
        }
        
        // then
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_when_queue_is_empty_and_dequeue_then_return_nil() {
        // given
        
        // when
        let value = sut.dequeue()
        
        // then
        XCTAssertNil(value)
    }
    
    func test_when_queue_is_empty_and_peek_then_return_nil() {
        // given
        
        // when
        let value = sut.peek()
        
        // then
        XCTAssertNil(value)
    }
    
    func test_when_exceeding_dequeue_then_return_nil() {
        // given
        let items: [String] = ["s", "t", "e", "v", "e", "n"]
        
        // when
        items.forEach {
            sut.enqueue($0)
        }
        
        items.indices.forEach { _ in
            let value = sut.peek()
            XCTAssertEqual(value, sut.dequeue())
        }
        
        // then
        XCTAssertNil(sut.dequeue())
    }
}
