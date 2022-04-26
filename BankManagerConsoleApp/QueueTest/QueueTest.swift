//
//  QueueTest.swift
//  QueueTest
//
//  Created by 우롱차, 민성 on 2022/04/26.
//

import XCTest
@testable import BankManagerConsoleApp

class QueueTest: XCTestCase {
    var queue: Queue<Int>!
    
    override func setUpWithError() throws {
        queue = Queue()
    }

    override func tearDownWithError() throws {
        queue = nil
    }
    
    func test_enqueue_dequeue_1_2_3을_enqueue_dequeue_clear했을때_값이_올바른가() {
        //given
        let expectedValue1 = 1
        let expectedValue2 = 2
        let expectedValue3 = 3
        //when
        queue.enqueue(expectedValue1)
        queue.enqueue(expectedValue2)
        queue.enqueue(expectedValue3)
        let result1 = queue.dequeue()
        let result2 = queue.dequeue()
        let result3 = queue.dequeue()
        let resultIsEmpty = queue.isEmpty()
        //then
        XCTAssertEqual(result1, expectedValue1)
        XCTAssertEqual(result2, expectedValue2)
        XCTAssertEqual(result3, expectedValue3)
        XCTAssert(resultIsEmpty)
    }
    
    func test_isEmpty_flase일때_결과가_올바른가() {
        //given
        let inputValue1 = 1
        let inputValue2 = 2
        let inputValue3 = 3
        //when
        queue.enqueue(inputValue1)
        queue.enqueue(inputValue2)
        queue.enqueue(inputValue3)
        let result1 = queue.isEmpty()
        
        //then
        XCTAssertFalse(result1)
    }
    
    func test_peak_했을때_값이_올바른가() {
        //given
        let expectedValue1 = 1
        let expectedValue2 = 2
        //when
        queue.enqueue(expectedValue1)
        queue.enqueue(expectedValue2)
        let result = queue.peek()
        let _ = queue.dequeue()
        let result2 = queue.peek()
        let _ = queue.dequeue()
        //then
        XCTAssertEqual(expectedValue1, result)
        XCTAssertEqual(expectedValue2, result2)
    }
}
