//
//  DoubleLinkedListTests.swift
//  DoubleLinkedListTests
//
//  Created by mmim, malrang.
//

import XCTest
@testable import Pods_BankManagerConsoleApp

class DoubleLinkedListTests: XCTestCase {
    
    var sut: DoubleLinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DoubleLinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_enqueue를_한번_호출했을때_sut의_count가_1이된다() {
        // given
        sut.enqueue(value: 3)
        
        // when
        let result = sut?.count
        
        // then
        XCTAssertEqual(result, 1)
    }
 
    func test_enqueue_한번_호출했을때_sut의_count가_1이된다() {
        // given
        sut.enqueue(value: 3)
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_() {
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }

    func test_enqueue를_호출한후_dequeue를_호출하면_isEmpty가_true가된다() {
        // given
        sut.enqueue(value: 3)
        _ = sut.dequeue()

        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }

    func test_enqueue를_2번_호출한후_clearAll_호출하면_isEmpty가_true가된다() {
        // given
        sut.enqueue(value: 3)
        sut.enqueue(value: 2)
        sut.clearAll()

        // when
        let isEmpty = sut.isEmpty

        // then
        XCTAssertTrue(isEmpty)
    }
    
    func test_enqueue를_2번_호출한면_peek의_값이_3이된다() {
        // given
        sut.enqueue(value: 3)
        sut.enqueue(value: 2)
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, 3)
    }
}
