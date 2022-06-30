//
//  BankManagerQueueTest.swift
//  BankManagerQueueTest
//
//  Created by Kiwi, Kay on 2022/06/27.
//

import XCTest
//@testable import BankManagerConsoleApp

class BankManagerQueueTest: XCTestCase {
    var sut: BankManagerQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = BankManagerQueue<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_리스트_초기화_후_isEmpty값이_true여야한다() {
        //given
        let sut = Linkedlist<Int>()
        //when,then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_1을_넣어주고_enqueue를_실행하면_isEmpty값이_false여야한다() {
        //given
        sut.enqueue(data: 1)
        //when,then
        XCTAssertFalse(sut.isEmpty)
    }
    
    func test_1_2_3을_넣어주고_dequeue를_실행하면_1이_나와야한다() {
        //given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.enqueue(data: 3)
        //when
        let firstElement = sut.dequeue()
        //then
        XCTAssertEqual(firstElement, 1)
    }
    
    func test_1_2_3을_입력_후_clear_하면_isEmpty값이_true여야한다() {
        //given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.enqueue(data: 3)
        //when
        sut.clear()
        //then
        XCTAssertTrue(sut.isEmpty)
    }
    func test_1_2_3을_넣어주고_peek을하면_1이나와야한다() {
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        sut.enqueue(data: 3)
        let expected = 1
        XCTAssertEqual(expected, sut.peek())
    }
}
