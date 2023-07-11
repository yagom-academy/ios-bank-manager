//
//  CustomelQueueTests.swift
//  BankManagerUIAppTests
//
//  Created by redmango1446 on 2023/07/11.
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
        let expectation = true
        
        // then
        XCTAssertTrue(expectation)
    }
    
    func test_isEmpty_1을_enqueue하면_isEmpty의값은_false이다() {
        // given
        sut.enqueue(1)
        
        // when
        let expectation = false
        
        // then
        XCTAssertFalse(expectation)
    }
    
    func test_isEmpty_1을_enqueue하고_dequeue하면_isEmpty의값은_true이다() {
        // given
        sut.enqueue(1)
        let _ = sut.dequeue()
        
        // when
        let expectation = true
        
        // then
        XCTAssertTrue(expectation)
    }
    
    func test_enqueue_enqueue로Queue에_1을넣고_dequeue하면_1을반환한다() {
        // given
        sut.enqueue(1)
        
        // when
        let expectation = sut.dequeue()
        
        // then
        XCTAssertEqual(expectation, 1)
    }
    
    func test_dequeue_() {
        // given
        
        // when
        
        // then
    }
    
    func test_peek_() {
        // given
        
        // when
        
        // then
    }
    
    func test_clear_() {
        // given
        
        // when
        
        // then
    }
}
