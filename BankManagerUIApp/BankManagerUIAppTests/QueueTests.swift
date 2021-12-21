//
//  BankManagerUIAppTests - BankManagerUIAppTests.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import XCTest
@testable import BankManagerUIApp

class QueueTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Int>.init()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_실행() {
        // when
        sut.enqueue(1)
        
        // then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_비어있는_큐에서_dequeue_실행() {
        // then
        XCTAssertNil(sut.dequeue())
    }
    
    func test_비어있지않은_큐에서_dequeue_실행() {
        // given
        let item = 4
        sut.enqueue(item)
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, item)
    }
    
    func test_비어있는_큐에서_clear_실행() {
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_비어있지않은_큐에서_clear_실행() {
        // given
        sut.enqueue(5)
        
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_비어있는_큐에서_peek_실행() {
        // then
        XCTAssertNil(sut.peek())
    }
    
    func test_비어있지않은_큐에서_peek_실행() {
        // given
        let firstItem = 36
        let secondItem = 64
        sut.enqueue(firstItem)
        sut.enqueue(secondItem)
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, firstItem)
    }
}
