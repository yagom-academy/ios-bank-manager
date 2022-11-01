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
    
    func test_enqueue호출후_dequeue호출하면_같은_값이_나오는지() {
        //given
        sut.enqueue(value: 3)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 3)
    }
}
