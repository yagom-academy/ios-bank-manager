//
//  QueueMethodTest.swift
//  QueueMethodTest
//
//  Created by 이윤주 on 2021/07/28.
//

import XCTest
@testable import BankManagerConsoleApp

class QueueMethodTest: XCTestCase {
    func test_testQueuee에_1을추가했을때_Queue의첫번째값이1일것이다() {
        //given
        var testQueue = Queue<Int>()
        
        //when
        testQueue.enqueue(1)
        testQueue.enqueue(2)
        let outputValue = testQueue.peek() ?? .zero
        let expectedResult = 1
        
        //then
        XCTAssertEqual(outputValue, expectedResult)
    }
    
    func test_비어있는Queue를_isEmpty메소드로확인했을때_결과값이true가나올것이다() {
        //given
        var testQueue = Queue<Int>()
        
        //when
        let outputValue = testQueue.isEmpty()
        let expectedResult = true
        
        //then
        XCTAssertEqual(outputValue, expectedResult)
    }
    
    func test_값이있는Queue를_isEmpty메소드로확인했을때_결과값이false가나올것이다() {
        // given
        var testQueue = Queue<Int>()
        testQueue.enqueue(1)
        
        //when
        let outputValue = testQueue.isEmpty()
        let expectedResult = false
        
        //then
        XCTAssertEqual(outputValue, expectedResult)
    }
    
    func test_Queue에_1과2를넣고_dequeu메소드사용시_Queue의가장첫번째값은2가된다() {
        //given
        var testQueue = Queue<Int>()
        testQueue.enqueue(1)
        testQueue.enqueue(2)
        
        //when
        testQueue.dequeue()
        let outputValue = testQueue.peek() ?? .zero
        let expectedResult = 2
        
        //then
        XCTAssertEqual(outputValue, expectedResult)
    }
    
 
    
}
