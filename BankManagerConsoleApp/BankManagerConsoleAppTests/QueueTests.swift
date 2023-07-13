//
//  QueueTests.swift
//  BankManagerConsoleAppTests
//
//  Created by hoon, minsup on 2023/07/11.
//

import XCTest
@testable import BankManagerConsoleApp

final class QueueTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐를_초기화하면_list가_빈_링크드리스트로_초기화된다() {
        // when
        let expectation = [Int]()
        
        // then
        XCTAssertEqual(sut.exposedList.elements, expectation)
    }
    
    func test_큐를_초기화하면_isEmpty가_true를_반환한다() {
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_요소_1234를_enqueue하면_큐의_요소가_4개가_된다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        
        // when
        let expectation = 4
        
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_요소_1234를_enqueue하면_요소_1234가_저장된다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        
        // when
        let expectation = [1, 2, 3, 4]
        
        // then
        XCTAssertEqual(sut.exposedList.elements, expectation)
    }
    
    func test_빈_큐에서_dequeue를_호출하면_nil을_반환한다() {
        // then
        XCTAssertNil(sut.dequeue())
    }
    
    func test_요소_1234가_저장된_큐에서_dequeue를_4번_호출하면_1234가_순서대로_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()
        let result3 = sut.dequeue()
        let result4 = sut.dequeue()
        
        // when
        let expectation1 = 1
        let expectation2 = 2
        let expectation3 = 3
        let expectation4 = 4
        
        // then
        XCTAssertEqual(result1, expectation1)
        XCTAssertEqual(result2, expectation2)
        XCTAssertEqual(result3, expectation3)
        XCTAssertEqual(result4, expectation4)
    }
    
    func test_3개의_요소가_들어있는_큐에서_dequeue를_3번_호출하면_isEmpty가_true를_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        // when
        let _ = sut.dequeue()
        let _ = sut.dequeue()
        let _ = sut.dequeue()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_3개의_요소가_들어있는_큐에서_dequeue를_2번_호출하면_isEmpty가_false를_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        // when
        let _ = sut.dequeue()
        let _ = sut.dequeue()
        
        // then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_5개의_요소가_들어있는_큐에서_clear을_호출하면_isEmpty가_true를_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        sut.enqueue(5)
        
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_빈_큐에서_peek를_호출하면_nil을_반환한다() {
        // then
        XCTAssertNil(sut.peek)
    }
    
    func test_요소_1234가_저장된_큐에서_peek를_호출하면_1을_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        
        // when
        let expectation = 1
        
        // then
        XCTAssertEqual(sut.peek, expectation)
    }
}
