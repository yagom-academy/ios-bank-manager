//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by brody, christy, harry on 2023/03/06.
//

import XCTest

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_List가비어있을때_appendLast로_5를추가하면_head의값은5이다() {
        // given
        sut = LinkedList<Int>()
        let expectation = 5
        
        // when
        sut.appendLast(value: 5)
        let result = sut.head?.value
        
        // then
        XCTAssertEqual(result, expectation)
        
    }
    
    func test_List에_노드가있을때_appendLast로_6을추가하면_tail의값은6이다() {
        // given
        sut = LinkedList<Int>()
        sut.appendLast(value: 5)
        let expectation = 6
        
        // when
        sut.appendLast(value: 6)
        let result = sut.tail?.value
        
        // then
        XCTAssertEqual(result, expectation)
    }
}

