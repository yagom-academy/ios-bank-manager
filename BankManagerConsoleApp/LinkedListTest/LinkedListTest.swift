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
        let sut = try XCTUnwrap(sut)
        
        XCTAssertFalse(sut.isEmpty)
    }
}
