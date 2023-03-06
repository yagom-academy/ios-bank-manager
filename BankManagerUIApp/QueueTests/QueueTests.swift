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

    func test_Queue가비어있을때_isEmpty가_true를반환한다() {
        //given
        let expectation = true
        //when
        let result = sut.isEmpty
        //then
        XCTAssertEqual(result, expectation)
    }
    
    func test_enqueue되었을경우_false를반환한다() {
        //given
        let expectation = false
        //when
        sut.enqueue("hello")
        let result = sut.isEmpty
        //then
        XCTAssertEqual(result, expectation)
    }
    
}
