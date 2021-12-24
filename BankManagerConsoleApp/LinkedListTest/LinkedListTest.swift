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

    func test_isEmpty_withEmptyLinkedList_shouldReturnTrue() throws {
        let linkedList = try XCTUnwrap(sut)

        XCTAssertTrue(linkedList.isEmpty)
    }

    func test_peek_withEmptyLinkedList_shouldReturnNil() throws {
        let linkedList = try XCTUnwrap(sut)

        XCTAssertNil(linkedList.peek())
    }
    
    func test_peek_withLinkedListHavingNumberOne_shouldReturnNumberOne() throws {
        var linkedList = try XCTUnwrap(sut)
        
        linkedList.append(1)
        
        XCTAssertEqual(linkedList.peek(), 1)
    }

    func test_removeAll_shouldRemoveAll() throws {
        var linkedList = try XCTUnwrap(sut)
        
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        linkedList.removeAll()
        
        XCTAssertTrue(linkedList.isEmpty)
    }
    
    func test_append_shouldAddNode() throws {
        var linkedList = try XCTUnwrap(sut)
        
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)

        XCTAssertEqual(linkedList.peek(), 1)
    }
    
    func test_removeFirst_shouldRemoveFirstNode() throws {
        var linkedList = try XCTUnwrap(sut)
        
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        
        XCTAssertEqual(linkedList.removeFirst(), 1)
    }
    
    func test_removeFirst_withEmptyLinkedList_shouldReturnNil() throws {
        var linkedList = try XCTUnwrap(sut)
        
        XCTAssertNil(linkedList.removeFirst())
    }
}
