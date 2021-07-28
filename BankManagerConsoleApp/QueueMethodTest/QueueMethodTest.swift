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
        let outputValue = testQueue.peek() ?? .zero
        let expectResult = 1
        
        //then
        XCTAssertEqual(outputValue, expectResult)
    }
    
    func test_비어있는Queue를_isEmpty메소드로확인했을때_결과값이true가나올것이다() {
        //given
        var testQueue = Queue<Int>()
        
        //when
        let outputValue = testQueue.isEmpty()
        let expectResult = true
        
        //then
        XCTAssertEqual(outputValue, expectResult)
    }
}
