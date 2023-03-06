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

    func test_빈List인경우_1을추가하면_마지막값이1이다() {
        // given
        let expectation = "1"

        // when
        sut.appendLast(expectation)
        let tailOfQueue = sut.tail?.orderNumber

        // then
        XCTAssertEqual(expectation, tailOfQueue)
    }
    
    func test_List에1_2를추가하는경우_head의next_orderNumber는2이다() {
        // given, when
        sut.appendLast("1")
        let targetNode = sut.head
        sut.appendLast("2")
        let expectation = sut.tail?.orderNumber
        
        // then
        XCTAssertEqual(targetNode?.next?.orderNumber, expectation)
    }
    
    func test_removeFirst호출시_빈List인경우_nil을반환한다() {
        // given, when
        let result = sut.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_removeFirst호출시_List에head하나만있는경우_head를삭제하고_반환된orderNumber는_1이다() {
        // given
        sut.appendLast("1")
        let expectation = sut.head?.orderNumber

        // when
        let result = sut.removeFirst()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_peek의값과_removeFirst호출시_삭제된head의orderNumber값과같다() {
        // given
        sut.appendLast("1")
        let expectation = sut.peek

        // when
        let result = sut.removeFirst()

        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_removeAll호출시_head와tail모두nil이된다() {
        // given
        let head = sut.head
        let tail = sut.tail
        var condition: Bool {
            head == nil && tail == nil
        }
        
        // when
        sut.removeAll()
        
        // then
        XCTAssertTrue(condition)
    }
}
