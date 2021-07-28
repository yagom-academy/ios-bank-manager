//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by 김태영 on 2021/07/28.
//
import XCTest

@testable import BankManagerConsoleApp


class BankManagerConsoleAppTests: XCTestCase {
    
    var sutQueue: LinkedListQueue<Int>!
    
    override func setUp() {
        super.setUp()
        sutQueue = LinkedListQueue()
    }
    // given
    // when
    // then

    func test_enqueue_했을때_새로운_노드가_추가된다() {
        // given
        let value = 1
        // when
        sutQueue.enqueue(value: value)
        let result = sutQueue.peek
        // then
        XCTAssertEqual(value, result)
    }
    
    func test_dequeue_했을때_head의_값이_반환된다() {
        // given
        let value = 1
        sutQueue.enqueue(value: value)
        // when
        let result = sutQueue.dequeue()
        // then
        XCTAssertEqual(value, result)
    }
}
