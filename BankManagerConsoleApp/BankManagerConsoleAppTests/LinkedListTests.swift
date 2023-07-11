//
//  LinkedListTests.swift
//  BankManagerConsoleAppTests
//
//  Created by hoon, minsup on 2023/07/11.
//

import XCTest
@testable import BankManagerConsoleApp

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_링크드리스트를_초기화하면_head와_tail이_nil로_초기화된다() {
        // then
        XCTAssertNil(sut.exposedHead)
        XCTAssertNil(sut.exposedTail)
    }
    
    func test_링크드리스트를_초기화하면_isEmpty가_true를_반환한다() {
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_요소_1234를_append하면_링크드리스트의_요소가_4개가_된다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        sut.append(4)
        
        // when
        let expectation = 4
        
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_요소_1234를_추가하면_요소_1234가_저장된다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        sut.append(4)
        
        // when
        let expectation = [1, 2, 3, 4]
        
        // then
        XCTAssertEqual(sut.elements, expectation)
    }
    
    func test_빈_링크드리스트에서_removeFirst를_호출하면_nil을_반환한다() {
        // then
        XCTAssertNil(sut.removeFirst())
    }
    
    func test_요소_1234가_저장된_링크드리스트에서_removeFirst를_4번_호출하면_1234가_순서대로_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        sut.append(4)
        
        let result1 = sut.removeFirst()
        let result2 = sut.removeFirst()
        let result3 = sut.removeFirst()
        let result4 = sut.removeFirst()
        
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
    
    func test_3개의_요소가_들어있는_링크드리스트에서_removeFirst를_3번_호출하면_isEmpty가_true를_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        // when
        let _ = sut.removeFirst()
        let _ = sut.removeFirst()
        let _ = sut.removeFirst()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_3개의_요소가_들어있는_링크드리스트에서_removeFirst를_2번_호출하면_isEmpty가_false를_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        // when
        let _ = sut.removeFirst()
        let _ = sut.removeFirst()
        
        // then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_5개의_요소가_들어있는_링크드리스트에서_removeAll을_호출하면_isEmpty가_true를_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        sut.append(4)
        sut.append(5)
        
        // when
        sut.removeAll()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_3개의_요소가_들어있는_링크드리스트에서_removeAll을_호출하면_head와_tail이_nil로_저장된다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        // when
        sut.removeAll()
        
        // then
        XCTAssertNil(sut.exposedHead)
        XCTAssertNil(sut.exposedTail)
    }
    
    func test_빈_링크드리스트에서_first를_호출하면_nil을_반환한다() {
        // then
        XCTAssertNil(sut.first)
    }
    
    func test_요소_1234가_저장된_링크드리스트에서_first를_호출하면_1을_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        sut.append(4)
        
        // when
        let expectation = 1
        
        // then
        XCTAssertEqual(sut.first, expectation)
    }
}
