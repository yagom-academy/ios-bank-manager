//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by 양호준 on 2021/12/21.
//

import XCTest

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func test_isEmpty_shouldReturnExactBooleanType() throws {
        sut?.head = Node(data: 1)
        let result = try XCTUnwrap(sut)

        XCTAssertFalse(result.isEmpty)
    }

    func test_peek_shouldReturnHeadData() throws {
        sut?.head = Node(data: 1)
        let result = try XCTUnwrap(sut)

        XCTAssertEqual(result.peek(), 1)
    }

    func test_clear_shouldRemoveAll() throws {
        sut?.head = Node(data: 1)
        sut?.head?.next = Node(data: 2)
        sut?.head?.next?.next = Node(data: 3)
        var result = try XCTUnwrap(sut)
        
        result.clear()
        
        XCTAssertNil(result.head)
    }
    
    func test_enqueue_shouldAddNode() throws {
        sut?.enqueue(1)
        sut?.enqueue(2)
        sut?.enqueue(3)
        let result = try XCTUnwrap(sut)
        
        XCTAssertEqual(result.head?.data, 1)
        XCTAssertEqual(result.tail?.data, 3)
    }
}
