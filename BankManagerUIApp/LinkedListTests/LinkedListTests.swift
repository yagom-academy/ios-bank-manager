//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Kiseok on 11/13/23.
//

import XCTest
@testable import BankManagerUIApp

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
        sut = nil
    }
    
    func test_linkedlist에아무것도없을때_isEmpty호출시_true를반환하는지() {
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
}
