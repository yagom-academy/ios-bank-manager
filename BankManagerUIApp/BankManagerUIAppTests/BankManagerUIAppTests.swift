//
//  BankManagerUIAppTests - BankManagerUIAppTests.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import XCTest
@testable import BankManagerUIApp

class BankManagerUIAppTests: XCTestCase {
    var sut: LinkedListQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedListQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue를_호출하여_1과2와3을_넣고_노드개수가_3개면_True를_반환하는지() {
        // given
        let expectation = 3
        
        // when
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_dequeue_1과2를_넣고_dequeue를_호출하면_값이_1인지() {
        //given
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_1과2를_넣고_clear를_호출하면_값이_없는지() {
        //given
        sut.enqueue(value: 1)
        sut.enqueue(value: 2)
        
        //when
        sut.clear()
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_peek_2와3을_넣고_peek를_호출하면_값이_2인지() {
        //given
        sut.enqueue(value: 2)
        sut.enqueue(value: 3)
        
        //when
        let result = sut.peek()
        
        //then
        XCTAssertEqual(result, 2)
    }
}
