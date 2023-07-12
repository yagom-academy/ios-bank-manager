//
//  QueueTest.swift
//  QueueTest
//
//  Created by karen on 2023/07/11.
//

import XCTest

final class QueueTest: XCTestCase {
    var sut: CustomerWatingQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerWatingQueue<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    //MARK: - isEmpty test
    func test_list가_비어있으면_isEmpty는_true이다() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, true)
    }
    
    //MARK: - peek test
    func test_enqueue된_값이_있을때_peek접근시_첫번째값을_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        let expectation = 1
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - enqueue test
    func test_enqueue를_실행하면_isEmpty는_false이다() {
        // given
        sut.enqueue(10)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, false)
    }
    
    //MARK: - dequeue test
    func test_enqueue된값이_없을때_dequeue실행시_nil을_반환한다() {
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, nil)
    }
    
    func test_enqueue된값이_1_2_3일때_dequeue실행시_1을_반환한다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        let expectation = 1
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - clear test
    func test_clear실행시_isEmpty는_true이다() {
        // given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        // when
        sut.clear()
        
        // then
        XCTAssertEqual(sut.isEmpty, true)
    }
}
