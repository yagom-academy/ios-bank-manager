//
//  BankManagerUIAppTests - BankManagerUIAppTests.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import XCTest
@testable import BankManagerUIApp

class QueueTests: XCTestCase {
    typealias Value = Int
    
    var sut: Queue<Value>!
    
    let items = [1,2]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Value>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_실행() {
        // when
        let item = items[0]
        sut.enqueue(item)
        
        // then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_비어있는_큐에서_dequeue_실행() {
        // then
        XCTAssertNil(sut.dequeue())
    }
    
    func test_비어있지않은_큐에서_dequeue_실행() {
        // given
        let item = items[0]
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
        let item = items[0]
        sut.enqueue(item)
        
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
        let firstItem = items[0]
        let secondItem = items[1]
        sut.enqueue(firstItem)
        sut.enqueue(secondItem)
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertEqual(result, firstItem)
    }
    
    func test_비어있는_큐에서_isEmpty_확인() {
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_비어있지않은_큐에서_isEmpty_확인() {
        // given
        let item = items[0]
        sut.enqueue(item)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
}
