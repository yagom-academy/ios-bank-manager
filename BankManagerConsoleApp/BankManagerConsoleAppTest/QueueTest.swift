//
//  QueueTest.swift
//  QueueTest
//
//  Created by 애쉬, 로빈 on 2022/11/01.
//

import XCTest

class QueueTest: XCTestCase {
    var sut: Queue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_queue에linkedList의count가0일때_isEmpty가true를반환해야한다() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_queue에linkedList의count가0이아닐때_isEmpty가false를반환해야한다n() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_queue에n개의값을enqueue했을때_카운트가n이어야한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        // when
        let result = sut.linkedList.count
        
        // then
        XCTAssertEqual(3, result)
    }
    
    func test_queue에순서대로enqueue했을때_dequeue값은첫번째값이어야한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(1, result)
    }
    
    func test_clear호출시_isEmpty가true를반환해야한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.clear()
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_peek호출시_head의value값을반환해야한다() {
        // given
        sut.enqueue(3)
        sut.enqueue(2)
        sut.enqueue(1)
        
        // when
        let result = sut.peek()
        
        // then
        XCTAssertEqual(3, result)
    }
}
