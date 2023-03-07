//
//  QueueTests.swift
//  QueueTests
//
//  Created by 레옹아범, 혜모리 on 2023/03/06.
//

import XCTest

final class QueueTests: XCTestCase {
    
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐가_비어있다면_peek는_nil이다() {
        // given
        // when
        let result = sut.peek
        // then
        XCTAssertNil(result)
    }
    
    func test_큐에_1을_추가한다면_peek는_1이다() {
        // given
        let expectation = "1"
        
        sut.enqueue("1")
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_큐가_비어있다면_isEmpty는_true다() {
        // given
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_큐에_1을_추가한다면_isEmpty는_false다() {
        // given
        sut.enqueue("1")
        // when
        let result = sut.isEmpty
        // then
        XCTAssertFalse(result)
    }
    
    func test_큐에_1을_추가한다면_dequeue는_1을_반환한다() {
        // given
        let expectation = "1"
        
        sut.enqueue("1")
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_큐가_비어있다면_dequeue는_nil이다() {
        // given
        // when
        let result = sut.dequeue()
        // then
        XCTAssertNil(result)
    }
    
    func test_clear호출시_isEmpty는_true이다() {
        // given
        sut.enqueue("2")
        sut.enqueue("1")
        sut.enqueue("3")
        // when
        sut.clear()
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
}
