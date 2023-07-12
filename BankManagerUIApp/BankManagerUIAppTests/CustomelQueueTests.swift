//
//  CustomelQueueTests.swift
//  BankManagerUIAppTests
//
//  Created by Yetti, Redmango on 2023/07/11.
//

import XCTest
@testable import BankManagerUIApp

final class CustomelQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_isEmpty_Queue에_아무값도_넣지않으면_isEmpty의값은_true이다() {
        // given
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty_1을_enqueue하면_isEmpty의값은_false이다() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_isEmpty_1을_enqueue하고_dequeue하면_isEmpty의값은_true이다() {
        // given
        sut.enqueue(1)
        let _ = sut.dequeue()
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_enqueue_enqueue로Queue에_1을넣고_dequeue하면_1을반환한다() {
        // given
        sut.enqueue(1)
        
        // when
        let expectation = 1
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_1_2_3을_순서대로_enqueue하고_dequeue를_2번하면_마지막으로_반환되는값은_2이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        // when
        let expectation = 2
        var result = sut.dequeue()
        result = sut.dequeue()
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_dequeue_enqueue를_하지않고_dequeue를_하면_nil이_반환된다() {
        // given
        // when
        let result: Int? = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_dequeue_1을_enqueue를_하고_dequeue를_2번하면_마지막으로_반환되는값은_nil이다() {
        // given
        sut.enqueue(1)
        
        // when
        var result = sut.dequeue()
        result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_peek_Queue에_아무값도_넣지않았을때_nil을_반환한다() {
        // given
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertNil(result)
    }
    
    func test_peek_1을_equeue했을때_1을반환한다() {
        // given
        sut.enqueue(1)
        
        // when
        let expectation = 1
        let result = sut.peek
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_peek_1과2를_enqueue했을때_1을_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        
        // when
        let expectation = 1
        let result = sut.peek
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_peek_1과2를_enqueue하고_한번dequeue하면_peek은_2을_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        let _ = sut.dequeue()
        
        // when
        let expectation = 2
        let result = sut.peek
        
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_clear_enqueue를_3번하고_clear를하면_isEmpty가_true를_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        // when
        sut.clear()
        let expectation = true
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(expectation, result)
    }
}
