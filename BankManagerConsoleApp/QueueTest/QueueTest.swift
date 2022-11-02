//
//  QueueTest.swift
//  QueueTest
//
//  Created by 맹선아 on 2022/10/31.
//

import XCTest
@testable import BankManagerConsoleApp

class QueueTest: XCTestCase {
    var sut: Queue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_append메서드호출시_queue의마지막에추가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.queue.last?.data
        
        //then
        XCTAssertEqual(2, result)
    }

    func test_isEmpty프로퍼티호출시_head가없으면_true를반환() {
        //give, when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty프로퍼티호출시_데이터가있으면_false를반환() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_dequeue메서드호출시_첫번째데이터를삭제하며반환() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(1, result)
        XCTAssertNotEqual(1, sut.queue.head?.data)
    }
    
    func test_peek메서드호출시_첫번째데이터를삭제없이반환() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        let result = sut.peek()
        
        //then
        XCTAssertEqual(1, result)
        XCTAssertEqual(1, sut.queue.head?.data)
    }

    func test_clear메서드호출시_linkedList의head가nil() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        
        //when
        sut.clear()
        
        //then
        XCTAssertNil(sut.queue.head)
    }
}
