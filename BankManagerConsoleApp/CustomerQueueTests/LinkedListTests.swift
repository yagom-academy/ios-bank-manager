//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 예톤, 웡빙 on 2022/06/28.
//

import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐의요소가비어있을때_빈값으로확인이되는지() {
        // given
        
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_큐의요소가비어있을때_dequeue를하면_nil이반환되는지() {
        // given
        
        // when
        let result = sut.removeFirst()
        // then
        XCTAssertNil(result)
    }
    
    func test_큐에값을3개넣어줄때_dequeue를하면_첫번째값이_제거되고반환되는지() {
        // given
        let expectation = 3
        sut = LinkedList(elements: [3, 7, 5])
        // when
        let result = sut.removeFirst()
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_큐에값을2개넣어줄때_peek을하면_첫번째값이반환되는지() {
        // given
        let expectation = 3
        sut = LinkedList(elements: [3, 7])
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_큐에값을2개넣어줄때_peek을여러번해도_똑같은값이_반환되는지() {
        // given
        sut = LinkedList(elements: [3, 7])
        // when
        let result = sut.peek
        let result2 = sut.peek
        // then
        XCTAssertEqual(result, result2)
    }
    
    func test_큐에값을3개넣어줄때_clear를하면_빈큐가되는지() {
        // given
        sut = LinkedList(elements: [3, 7, 5])
        sut.clear()
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
}
