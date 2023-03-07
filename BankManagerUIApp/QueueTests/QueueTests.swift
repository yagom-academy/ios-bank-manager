//
//  QueueTests.swift
//  QueueTests
//
//  Created by kaki, songjun on 2023/03/06.
//

import XCTest
@testable import BankManagerUIApp

final class QueueTests: XCTestCase {
    var sut: Queue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue가_비어있을때_isEmpty는_true를_반환한다() {
        // given
        let expectation = true
        // when
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue됐을_경우_isEmpty는_false를_반환한다() {
        // given
        let expectation = false
        sut.enqueue("hello")
        // when
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_queue가_비어있을때_dequeue할_경우_nil을_반환한다() {
        // given
        let expectation: String? = nil
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue됐을_경우_처음_enqueue된_데이터를_반환한다() {
        // given
        let expectation = "hello"
        sut.enqueue("hello")
        sut.enqueue("kaki")
        sut.enqueue("songjun")
        // when
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_2번_dequeue됐을_경우_두번째로_enqueue된_데이터를_반환한다() {
        // given
        let expectation = "kaki"
        sut.enqueue("hello")
        sut.enqueue("kaki")
        sut.enqueue("songjun")
        // when
        let _ = sut.dequeue()
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_peek했을_경우_dequeue될_데이터를_반환한다() {
        // given
        let expectation = "hello"
        sut.enqueue("hello")
        sut.enqueue("kaki")
        sut.enqueue("songjun")
        // when
        let result = sut.peek()!
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_peek이후에_dequeue될_경우_처음enqueue된_데이터를_반환한다() {
        // given
        let expectation = "hello"
        sut.enqueue("hello")
        sut.enqueue("kaki")
        sut.enqueue("songjun")
        // when
        let _ = sut.peek()
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_clear했을_경우_isEmpty는_true를_반환한다() {
        // given
        let expectation = true
        sut.enqueue("hello")
        sut.enqueue("kaki")
        sut.enqueue("songjun")
        // when
        sut.clear()
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }
}
