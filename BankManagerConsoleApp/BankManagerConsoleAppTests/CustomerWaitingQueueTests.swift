//
//  CustomerWaitingQueueTests.swift
//  BankManagerConsoleAppTests
//
//  Created by yyss99, 비모 on 2023/07/10.
//

import XCTest
@testable import BankManagerConsoleApp

final class CustomerWaitingQueueTests: XCTestCase {
    var sut: CustomerWaitingQueue<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerWaitingQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_초기상태에서_isEmpty가_true를_반환한다() {
        // given
        
        // when
        let result = sut.isEmpty
        let expectedValue = true
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_enqueue_했을때_isEmpty가_false를_반환한다() {
        // given
        sut.enqueue("something")
        
        // when
        let result = sut.isEmpty
        let expectedValue = false
        
        // then
        XCTAssertEqual(result, expectedValue)
    }

    func test_enqueue를_3회_하면_count가_3을_반환한다() {
        // given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        
        // when
        let result = sut.count
        let expectedValue = 3
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_enqueue_a후_dequeue시_a를_반환한다() {
        // given
        sut.enqueue("a")
        
        // when
        let result = sut.dequeue()
        let expectedValue = "a"
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_enqueue후_clear시_isEmpty가_true를_반환한다() {
        // given
        sut.enqueue("1")
        sut.enqueue("2")
        sut.enqueue("3")
        sut.clear()
        
        // when
        let result = sut.isEmpty
        let expectedValue = true
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_enqueue_a_b_c후_peek이_a를_반환한다() {
        // given
        sut.enqueue("a")
        sut.enqueue("b")
        sut.enqueue("c")
        
        // when
        let result = sut.peek
        let expectedValue = "a"
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_초기상태에서_dequeue가_nil을_반환한다() {
        // given
        
        // when
        let result = sut.dequeue()
        let expectedValue: String? = nil
        
        // then
        XCTAssertEqual(result, expectedValue)
    }
}
