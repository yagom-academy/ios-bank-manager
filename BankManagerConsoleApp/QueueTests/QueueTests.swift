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
}
