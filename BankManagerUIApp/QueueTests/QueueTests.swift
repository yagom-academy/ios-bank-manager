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

    func test_Queue가_비어있을때_isEmpty가_true를_반환한다() {
        // given
        let expectation = true
        // when
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue되었을경우_false를_반환한다() {
        // given
        let expectation = false
        // when
        sut.enqueue("hello")
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_Queue가_비어있을때_dequeue할경우_nil이_반환된다() {
        // given
        let expectation: String? = nil
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_dequeue됐을경우_처음_enqueue된_데이터가_반환된다() {
        // given
        let expectation = "hello"
        // when
        sut.enqueue("hello")
        sut.enqueue("kaki")
        sut.enqueue("songjun")
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_2번_dequeue됐을경우_두번째로_enqueue된_데이터가_반환된다() {
        // given
        let expectation = "kaki"
        // when
        sut.enqueue("hello")
        sut.enqueue("kaki")
        sut.enqueue("songjun")
        let _ = sut.dequeue()
        let result = sut.dequeue()!
        // then
        XCTAssertEqual(result, expectation)
    }
}
