//
//  QueueTests.swift
//  QueueTests
//
//  Created by Dasan & Mary on 2023/07/10.
//

import XCTest
@testable import BankManagerConsoleApp

final class QueueTests: XCTestCase {
    private var sut: Queue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }
    
    func test_enqueue_enqueue_1을했을때_queue의_peek값은_1이다() {
        // given
        sut.enqueue(1)
        let expectation = 1
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue_enqueue_3_4_5를했을때_queue의_peek값은_3이다() {
        // given
        sut.enqueue(3)
        sut.enqueue(4)
        sut.enqueue(5)
        let expectation = 3
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_조건없이_queue에_dequeue를하면_nil를_반환한다() {
        // given, when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_dequeue_enqueue_3_4_5를하고_dequeue를하면_3을_반환한다() {
        // given
        sut.enqueue(3)
        sut.enqueue(4)
        sut.enqueue(5)
        let expectation = 3
 
        // when
        let result = sut.dequeue()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_enqueue_3_4_5를하고_dequeue를_3번했을때_3_4_5를_순서대로_반환한다() {
        // given
        let expectation = [3, 4, 5]
        expectation.forEach { sut.enqueue($0) }
        
        // when
        var result: [Int?] = (0..<expectation.count).map { _ in sut.dequeue() }

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue_enqueue_3_4_5를하고_dequeue를_3번했을때_peek값은_nil이다() {
        // given
        sut.enqueue(3)
        sut.enqueue(4)
        sut.enqueue(5)
        _ = sut.dequeue()
        _ = sut.dequeue()
        _ = sut.dequeue()
        
        // when
        let result = sut.peek

        // then
        XCTAssertNil(result)
    }
    
    func test_peek_enqueue_3_4_5를하고_dequeue를하면_peek값은_4이다() {
        // given
        sut.enqueue(3)
        sut.enqueue(4)
        sut.enqueue(5)
        _ = sut.dequeue()
        let expectation = 4
        
        // when
        let result = sut.peek

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_isEmpty_조건없이_queue의_isEmpty를호출할때_isEmpty는_true이다() {
        // given, when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty_enqueue_1을했을때_isEmpty는_false이다() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isEmpty_enqueue_1_2를하고_dequeue를_2번했을때_isEmpty는_true이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        _ = sut.dequeue()
        _ = sut.dequeue()
        
        // when
        let result = sut.isEmpty

        // then
        XCTAssertTrue(result)
    }
    
    func test_clear_enqueue_1_2를하고_clear했을때_isEmpty은_true이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.clear()
        
        // when
        let result = sut.isEmpty

        // then
        XCTAssertTrue(result)
    }
    
    func test_clear_enqueue_1_2를하고_clear했을때_peek값은_nil이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.clear()
        
        // when
        let result = sut.peek

        // then
        XCTAssertNil(result)
    }
}
