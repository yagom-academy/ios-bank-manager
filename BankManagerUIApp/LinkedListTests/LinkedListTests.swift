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
    
    func test_linkedlist에1을넣었을때_head호출시_1이나오는지() {
        //given
        sut.append(data: 1)
        
        //when
        let result = sut.head?.data
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_linkedlist에1과2를넣었을때_head호출시_1이나오는지() {
        //given
        sut.append(data: 1)
        sut.append(data: 2)
        
        //when
        let result = sut.head?.data
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_linkedlist에1을넣었을때_tail호출시_1이나오는지() {
        //given
        sut.append(data: 1)
        
        //when
        let result = sut.tail?.data
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_linkedlist에1과3을넣었을때_tail호출시_3이나오는지() {
        //given
        sut.append(data: 1)
        sut.append(data: 3)
        
        //when
        let result = sut.tail?.data
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_linkedlist에1을넣었을때_removeFirst호출시_1이나오는지() {
        //given
        sut.append(data: 1)
        
        //when
        let result = sut.removeFirst()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_linkedlist에1과2를넣었을때_removeFirst호출시_1이나오는지() {
        //given
        sut.append(data: 1)
        sut.append(data: 2)
        
        //when
        let result = sut.removeFirst()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_linkedlist에1과2를넣었을때_removeAll호출시_모두초기화되는지() {
        //given
        sut.append(data: 1)
        sut.append(data: 2)
        
        //when
        sut.removeAll()
        
        //then
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}
