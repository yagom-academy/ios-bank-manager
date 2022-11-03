//  LinkedListTests.swift
//  LinkedListTests
//  Created by Baem & Bella on 2022/11/01.

import XCTest

class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_호출이_잘_되는지() {
        //given
        let input = 1
        
        //when
        sut.enqueue(value: input)
        
        //then
        XCTAssertEqual(sut.isEmpty, false)
    }
    
    func test_enqueue_호출후_dequeue_호출하면_같은_값이_나오는지() {
        //given
        sut.enqueue(value: 3)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_dequeue_호출시_여러개의_값중에_처음들어간_값이_나오는지() {
        //given
        sut.enqueue(value: 3)
        sut.enqueue(value: 2)
        sut.enqueue(value: 1)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_큐에_값이_없을때_dequeue_호출시_nil을_반환하는지() {
        //given
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, nil)
    }
    
    func test_clear_호출시_값이_초기화되는지() {
        //given
        sut.enqueue(value: 3)
        sut.enqueue(value: 2)
        sut.enqueue(value: 1)
        
        //when
        sut.clear()
        
        //then
        XCTAssertEqual(sut.dequeue(), nil)
    }
    
    func test_peek_호출시_처음넣은_값이_반환되는지() {
        //given
        sut.enqueue(value: 3)
        sut.enqueue(value: 2)
        sut.enqueue(value: 1)
        
        //when
        let result = sut.peek()
        
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_큐가_비었을때_peek_호출시_nil_반환되는지() {
        //given
        
        //when
        let result = sut.peek()
        
        //then
        XCTAssertEqual(result, nil)
    }
}
