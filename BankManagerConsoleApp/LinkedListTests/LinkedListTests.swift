//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 레옹아범, 혜모리 on 2023/03/06.
//

import XCTest

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<String>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_List에초기값은_비어있다() {
        // given
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_빈List인경우_1을추가하면_마지막값이1이다() {
        // given
        let expectation = "1"

        // when
        sut.appendLast(expectation)
        let tailOfQueue = sut.tail?.value

        // then
        XCTAssertEqual(expectation, tailOfQueue)
    }
    
    func test_List에1과_2를추가하는경우_head의next_value는2이다() {
        // given, when
        sut.appendLast("1")
        let targetNode = sut.head
        sut.appendLast("2")
        let expectation = sut.tail?.value
        
        // then
        XCTAssertEqual(targetNode?.next?.value, expectation)
    }
    
    func test_removeFirst호출시_빈List인경우_nil을반환한다() {
        // given, when
        let result = sut.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_removeFirst호출시_List에1하나만있는경우_반환된value는_1이다() {
        // given
        sut.appendLast("1")
        let expectation = "1"

        // when
        let result = sut.removeFirst()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈List에_1을_추가할_경우_peek의_값은_1이다() {
        // given
        sut.appendLast("1")
        let expectation = "1"

        // when
        let result = sut.peek

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_빈List에_1과_2를_추가하고_removeAll호출시_head와tail모두nil이된다() {
        // given
        sut.appendLast("1")
        sut.appendLast("2")
        
        // when
        sut.removeAll()
        
        let head = sut.head
        let tail = sut.tail
        var condition: Bool {
            head == nil && tail == nil
        }
        
        // then
        XCTAssertTrue(condition)
    }
}
