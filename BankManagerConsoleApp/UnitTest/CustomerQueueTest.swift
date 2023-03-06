//
//  CustomerQueueTest.swift
//  CustomerQueueTest
//
//  Created by Rowan on 2023/03/06.
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
    
    func test_enqueue호출시_list의count가plus1이된다() {
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
}
