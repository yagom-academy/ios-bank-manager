//
//  LinkedListTest.swift
//  QueueTest
//
//  Created by 애쉬, 로빈 on 2022/11/02.
//

import XCTest

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_list에_insertFirst로노드를집어넣으면_head값이_해당노드값이여야한다() {
        // given
        sut.insertFirst(2)
        
        // when
        let result = sut.head?.value
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_list에없는노드값을_search로호출했을때_nil이_반환돼야한다() {
        // given
        // when
        let result = sut.search(3)
        
        // then
        XCTAssertNil(result)
    }
    
    func test_list에있는노드값을_search로호출했을때_해당노드값을_반환해야한다() {
        // given
        sut.insertLast(3)
        
        // when
        let result = sut.search(3)?.value
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_list에없는노드값을_remove로호출했을때_nil을_반환해야한다() {
        // given
        // when
        let result = sut.remove(2)
        
        // then
        XCTAssertNil(result)
    }
    
    func test_list에있는노드값을_remove로호출했을때_해당노드값을_반환해야한다() {
        // given
        sut.insertFirst(2)
        
        // when
        let result = sut.remove(2)
        
        // then
        XCTAssertEqual(result, 2)
    }
}
