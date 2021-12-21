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
        linkedList.append(1)

        XCTAssertFalse(linkedList.isEmpty)
    }

    func test_peek_shouldReturnHeadData() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.append(1)

        XCTAssertEqual(linkedList.peek(), 1)
    }

    func test_clear_shouldRemoveAll() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.removeAll()
        
        XCTAssertTrue(linkedList.isEmpty)
    }
    
    func test_enqueue_shouldAddNode() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)

        XCTAssertEqual(linkedList.peek(), 1)
    }
    
    func test_dequeue_shouldRemoveFirstNode() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.removeFirst()
        
        XCTAssertEqual(linkedList.peek(), 2)
    }
    
    func test_dequeue_withEmptyLinkedList_shouldReturnNil() throws {
        var linkedList = try XCTUnwrap(sut)
        linkedList.removeFirst()
        
        XCTAssertTrue(linkedList.isEmpty)
    }
}
