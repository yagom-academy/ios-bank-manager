//
//  BankWaitingQueueTest.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/25.
//

import XCTest

class BankWaitingQueueTest: XCTestCase {
    var sut: BankWaitingQueue<MockList<Int>>!

    override func setUpWithError() throws {
        sut = BankWaitingQueue.init(MockList<Int>())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_1개_enqueue_후에_isEmpty호출_결과는_false() {
        //given
        sut.enqueue(1)
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_non_enqueue_했을때_isEmpty호출_결과는_true() {
        //given
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_2개_enqueue하고_1개_dequeue_했을때_isEmpty호출_결과는_false() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let peekValue = sut.peek
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(peekValue, result)
    }
    
    func test_2개_enqueue하고_clear_했을때_isEmpty_호출_결과는_true() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.clear()
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
}
