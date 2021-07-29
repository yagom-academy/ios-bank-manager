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
        //when
        let expectResult = queueSut.isEmpty
        //then
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
        //when
        let expectResult = queueSut.dequeue()
        //then
        XCTAssertNil(expectResult)
    }
}
