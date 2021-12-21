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
        var linkedList = try XCTUnwrap(sut)
        linkedList.enqueue(1)

        XCTAssertFalse(linkedList.isEmpty)
    }

    func test_peek_shouldReturnHeadData() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.enqueue(1)

        XCTAssertEqual(linkedList.peek(), 1)
    }

    func test_clear_shouldRemoveAll() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.enqueue(1)
        linkedList.enqueue(2)
        linkedList.enqueue(3)
        linkedList.clear()
        
        XCTAssertNil(linkedList.head)
    }
    
    func test_enqueue_shouldAddNode() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.enqueue(1)
        linkedList.enqueue(2)
        linkedList.enqueue(3)
        
        XCTAssertEqual(linkedList.head?.data, 1)
        XCTAssertEqual(linkedList.tail?.data, 3)
    }
    
    func test_dequeue_shouldRemoveFirstNode() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.enqueue(1)
        linkedList.enqueue(2)
        linkedList.enqueue(3)
        linkedList.dequeue()
        
        XCTAssertEqual(linkedList.head?.data, 2)
    }
    
    func test_dequeue_withEmptyLinkedList_shouldReturnNil() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.dequeue()
        
        XCTAssertNil(linkedList.head)
        XCTAssertNil(linkedList.tail)
    }
}
