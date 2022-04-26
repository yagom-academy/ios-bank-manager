//
//  QueueTests.swift
//  QueueTests
//
//  Created by 김동욱 on 2022/04/27.
//

import XCTest

class QueueTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue_enqueue호출시_item갯수는_1_증가한다() {
        // given
        sut.enqueue(1)
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue_dequeue호출시_item갯수는_1_감소한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        _ = sut.dequeue()
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue가_비어있을때_dequeue하면_nil을_반환한다() {
        // given, when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_queue_저장된값이_없을때_dequeue하면_queue의_item갯수는_0이다() {
        // given
        _ = sut.dequeue()
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_queue_clear호출시_queue가_비워진다() {
        // given
        sut.enqueue(1)
        sut.clear()
        
        // when
        let result = sut.count
        
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_queue_peek호출시_queue의_첫번째값을_조회한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue가_비어있을때_첫번째값을_조회하면_nil이다() {
        // given, when
        let result = sut.peek
        
        // then
        XCTAssertNil(result)
    }
    
    func test_queue_enqueue하지_않았다면_queue는_비어있다() {
        // given, when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
}
