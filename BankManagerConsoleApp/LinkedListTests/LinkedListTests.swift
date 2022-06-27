//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_초기상태일때_isEmpty의반환값이true인지() {
        // given
        
        // when
        let result = sut.isEmpty()
        // then
        XCTAssertTrue(result)
    }
    
    func test_enqueue로1을넣었을때_peek이1인지() {
        // given
        let expectation = 1
        // when
        sut.enqueue(data: 1)
        // then
        XCTAssertEqual(expectation, sut.peek())
    }
    
    func test_enqueue로3과7을넣었을때_peek이3인지() {
        // given
        let expectation = 3
        // when
        sut.enqueue(data: 3)
        sut.enqueue(data: 7)
        // then
        XCTAssertEqual(expectation, sut.peek())
    }
    
    func test_3과7과5를넣었을때_dequeue의반환값이3인지() {
        // given
        let expectation = 3
        // when
        sut.enqueue(data: 3)
        sut.enqueue(data: 7)
        sut.enqueue(data: 5)
        // then
        XCTAssertEqual(expectation, sut.dequeue())
    }
}
