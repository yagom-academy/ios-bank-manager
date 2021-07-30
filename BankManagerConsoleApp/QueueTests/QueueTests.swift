//
//  QueueTests.swift
//  QueueTests
//
//  Created by yun on 2021/07/29.
//

import XCTest
@testable import BankManagerConsoleApp

class QueueTests: XCTestCase {
    var queueSut = Queue<Int>()
    
    override func setUp() {
        queueSut = Queue<Int>()
    }
    
    func test_queue가_비어있다() {
        let expectResult = queueSut.isEmpty
        
        XCTAssertTrue(expectResult)
    }
    
    func test_queue에_1을_enqueue했을때_큐가_비어있지않다() {
        //given
        let number = 1
        //when
        queueSut.enqueue(data: number)
        let expectResult = queueSut.isEmpty
        //then
        XCTAssertFalse(expectResult)
    }
    
    func test_queue에_1_2_3을_enqueue했을때_첫번째요소는_1이다() {
        //given
        let one = 1
        let two = 2
        let three = 3
        //when
        queueSut.enqueue(data: one)
        queueSut.enqueue(data: two)
        queueSut.enqueue(data: three)
        let expectResult = queueSut.peek
        //then
        XCTAssertEqual(expectResult, one)
        XCTAssertNotEqual(expectResult, two)
        XCTAssertNotEqual(expectResult, three)
    }
    
    func test_빈queue에_dequeue를했을때_반환값은_nil이다() {
        let expectResult = queueSut.dequeue()
        
        XCTAssertNil(expectResult)
    }
    
    func test_enqueue를_세번하고_dequeue했을때_반환값확인() {
        //given
        let one = 1
        let two = 2
        let three = 3
        //when
        queueSut.enqueue(data: one)
        queueSut.enqueue(data: two)
        queueSut.enqueue(data: three)
        let expectResultOne = queueSut.dequeue()
        let expectResultTwo = queueSut.dequeue()
        let expectResultThree = queueSut.dequeue()
        //then
        XCTAssertEqual(expectResultOne, one)
        XCTAssertEqual(expectResultTwo, two)
        XCTAssertEqual(expectResultThree, three)
    }

    func test_1_2를enqueue하고_dequeue를한번하면_peek은_2을반환한다() {
        //given
        let one = 1
        let two = 2
        //when
        queueSut.enqueue(data: one)
        queueSut.enqueue(data: two)
        queueSut.dequeue()
        let expectResult = queueSut.peek
        // then
        XCTAssertEqual(expectResult, two)
    }
    
    func test_enqueue를두번하고_dequeue를두번하면_peek은nil이다() {
        // given
        let number1 = 123
        let number2 = 456
        // when
        queueSut.enqueue(data: number1)
        queueSut.enqueue(data: number2)
        queueSut.dequeue()
        queueSut.dequeue()
        let expectResult = queueSut.peek
        // then
        XCTAssertNil(expectResult)
    }
    
    func test_enqueue를여러번하고_clear하면_queue요소는없다() {
        //given
        let one = 1
        let two = 2
        let three = 3
        // when
        queueSut.enqueue(data: one)
        queueSut.enqueue(data: two)
        queueSut.enqueue(data: three)
        queueSut.clear()
        let expectResult = queueSut.isEmpty
        // then
        XCTAssertTrue(expectResult)
    }
}
