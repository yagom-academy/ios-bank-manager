//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 이원빈 on 2022/06/28.
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
    
    func test_초기상태일때_isEmpty의반환값이true인지() {
        // given
        
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_초기상태일때_removeFirst를하면_nil이반환되는지() {
        // given
        
        // when
        let result = sut.removeFirst()
        // then
        XCTAssertNil(result)
    }
    
    func test_3과7과5를넣었을때_removeFirst의반환값이3인지() {
        // given
        let expectation = 3
        sut.append(data: 3)
        sut.append(data: 7)
        sut.append(data: 5)
        // when
        let result = sut.removeFirst()
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_append로3과7을넣었을때_peek이3인지() {
        // given
        let expectation = 3
        sut.append(data: 3)
        sut.append(data: 7)
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_3과7과5를넣었을때_clear후peek이nil인지() {
        // given
        sut.append(data: 3)
        sut.append(data: 7)
        sut.append(data: 5)
        sut.clear()
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(result, nil)
    }
    
    func test_3과7과5를넣었을때_removeFirst3번후_isEmpty가true인지() {
        // given
        sut.append(data: 3)
        sut.append(data: 7)
        sut.append(data: 5)
        sut.removeFirst()
        sut.removeFirst()
        sut.removeFirst()
        // when
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, true)
    }
}
