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

    func test_queue에linkedList의count가0일때_isEmpty가true를반환하는지() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_queue에linkedList의count가0이아닐때_isEmpty가false를반환하는지() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
}
