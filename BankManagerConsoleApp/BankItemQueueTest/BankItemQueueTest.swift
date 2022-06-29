//
//  BankItemQueueTest.swift
//  BankItemQueueTest
//
//  Created by BaekGom, unchain on 2022/06/27.
//

import XCTest

class BankItemQueueTest: XCTestCase {

    var sut: BankItemQueue<String>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BankItemQueue<String>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_isEmpty호출시_비어있으면_true반환하는지() {
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty호출시_비어있지않으면_False반환하는지() {
        //given
        sut.enQueue("1")

        //when
        let result = sut.isEmpty

        //then
        XCTAssertFalse(result)
    }
    
    func test_peek함수가_리스트_첫번째_값을가져오는지() {
        //given
        sut.enQueue("1")
        sut.enQueue("2")
        sut.enQueue("3")
        let expectedNumber = "1"
        
        //when
        let peekGetNumber = sut.peek?.data

        //then
        XCTAssertEqual(expectedNumber, peekGetNumber)
    }
    
    func test_deQueue_리스트에아무것도없을때_nil반환하는지() {
        //when
        let result = sut.deQueue()

        //then
        XCTAssertNil(result)
    }

    func test_deQueue_리스트에서_맨앞에_값을제거하고_반환하는지() {
        //given
        sut.enQueue("1")
        sut.enQueue("2")
        sut.enQueue("3")
        let expectedNumber = "1"

        //when
        let result = sut.deQueue()

        //then
        XCTAssertEqual(expectedNumber, result)
    }
    
    func test_deQueue_리스트에서_head의_데이터가_다음값으로_변경되는지() {
        //given
        sut.enQueue("1")
        sut.enQueue("2")
        sut.enQueue("3")
        let expectedNumber = "2"

        //when
        sut.deQueue()
        let result = sut.peek?.data
        
        //then
        XCTAssertEqual(expectedNumber, result)
    }
    
    func test_clear_로_리스트모든값제거() {
        //given
        sut.enQueue("1")
        sut.enQueue("2")
        sut.enQueue("3")
        
        //when
        sut.clear()
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }
}
