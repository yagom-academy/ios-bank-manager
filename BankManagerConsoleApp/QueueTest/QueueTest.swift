//
//  QueueTest.swift
//  QueueTest
//
//  Created by tae hoon park on 2021/07/27.
//

import XCTest
import Foundation
@testable import BankManagerConsoleApp

class QueueTest: XCTestCase {
    var sut = Queue<Int>()
    
    override func setUp() {
        super.setUp()
        self.sut = Queue<Int>()
    }
    
    func test_값이들어있는큐에서_isEmpty호출시_false가나오는가() {
        // given
        sut.enqueue(1)
        // when
        let result = sut.isEmpty
        let expectResult = false
        // then
        XCTAssertEqual(result, expectResult)
    }
    
    func test_큐에1과2를넣었을때_peek를호출하면_1이나오는가() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        // when
        let result = sut.peek
        let expectResult = 1
        // then
        XCTAssertEqual(result, expectResult)
    }
    
    func test_값이들어있는큐에서_clear호출시_다비워지는가() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        // when
        sut.clear()
        let result = sut.isEmpty
        let expectResult = true
        // then
        XCTAssertEqual(result, expectResult)
    }
    
    func test_비어있는큐에_1과2를enqueue했을때_값이잘들어가는가() {
        // given
        // when
        sut.enqueue(1)
        sut.enqueue(2)
        let firstValue = sut.peek
        sut.dequeue()
        let secondValue = sut.peek
        let expectFirstValue = 1
        let expectSecondValue = 2
        // then
        XCTAssertEqual(firstValue, expectFirstValue)
        XCTAssertEqual(secondValue, expectSecondValue)
    }
    
    func test_1과2가들어있는큐에_dequeue호출후_peek가2인가() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        // when
        sut.dequeue()
        let result = sut.peek
        let expectResult = 2
        // then
        XCTAssertEqual(result, expectResult)
    }
}
