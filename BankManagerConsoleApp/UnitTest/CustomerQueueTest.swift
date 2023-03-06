//
//  CustomerQueueTest.swift
//  CustomerQueueTest
//
//  Created by 릴라, Rowan on 2023/03/06.
//

import XCTest

final class CustomerQueueTest: XCTestCase {
    var sut: CustomerQueue<Int>?
    
    override func setUpWithError() throws {
        sut = CustomerQueue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_enqueue호출시_list의count가_plus1이된다() {
        // given
        let testValue = 10
        let expectedResult = 1
        
        // when
        sut?.enqueue(testValue)
        let result = sut?.count
        
        // then
        XCTAssertEqual(expectedResult, result)
    }

    func test_dequeue호출시_Queue의_첫번째값이_반환된다() {
        // given
        sut?.enqueue(5)
        sut?.enqueue(10)
        let expectedResult = 5
        
        // when
        let result = sut?.dequeue()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_dequeue호출시_Queue의_Count가_1줄어든다() {
        // given
        sut?.enqueue(5)
        sut?.enqueue(10)
        let expectedResult = 1
        
        // when
        sut?.dequeue()
        let result = sut?.count
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_isEmpty호출시_Queue가_비어있다면_true를반환한다() {
        // given
        let expectedResult = true
        
        // when
        let result = sut?.isEmpty
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_isEmpty호출시_Queue가_비어있지않다면_false를반환한다() {
        // given
        sut?.enqueue(5)
        let expectedResult = false
        
        // when
        let result = sut?.isEmpty
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_clear호출시_Queue가_비워진다() {
        // given
        sut?.enqueue(5)
        sut?.enqueue(10)
        let expectedResult = true
        
        // when
        sut?.clear()
        let result = sut?.isEmpty
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_peek호출시_첫번째값이_반환된다() {
        // given
        sut?.enqueue(5)
        sut?.enqueue(10)
        let expectedResult = 5
        
        // when
        let result = sut?.peek()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_peek호출시_count가_감소하지않는다() {
        // given
        sut?.enqueue(5)
        sut?.enqueue(10)
        let expectedResult = 2
        
        // when
        sut?.peek()
        let result = sut?.count
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
}
