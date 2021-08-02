//
//  BankManagerTest.swift
//  BankManagerTest
//
//  Created by kjs on 2021/07/27.
//

@testable import BankManagerConsoleApp
import XCTest

class BankManagerTest: XCTestCase {
    var queue: Queue<Int>!
    
    override func setUp() {
        super.setUp()
        queue = Queue()
    }
    
    override func tearDown() {
        super.tearDown()
        queue = nil
    }
    
    func test_queue에_값을_enqueue하면_그값이_queue에_들어간다() {
        //given
        let expectedResult = 3
        queue.enqueue(value: 3)
        
        //when
        let enqueuedResult = queue.peek()
        
        //then
        XCTAssertEqual(enqueuedResult, expectedResult)
    }
    
    func test_값이_하나만들어간_queue에서_dequeue를하면_queue는_비어있다() {
        //given
        queue.enqueue(value: 3)
        
        //when
        let _ = queue.dequeue()
        
        //then
        XCTAssertEqual(queue.isEmpty, true)
    }
    
    func test_값이_들어간_queue에서_dequeue를하면_그값이_빠져나온다() {
        //given
        queue.enqueue(value: 3)
        
        //when
        let value = queue.dequeue()
        
        //then
        XCTAssertEqual(value, 3)
    }
    
    func test_여러개의_값이_들어간_queue에서_dequeue를하면_queue의_첫번째값은_처음상태의_두번째값이다() {
        //given
        let firstValue = 1
        let secondValue = 2
        let thirdValue = 3
        queue.enqueue(value: firstValue)
        queue.enqueue(value: secondValue)
        queue.enqueue(value: thirdValue)
        
        //when
        let _ = queue.dequeue()
        
        //then
        XCTAssertEqual(secondValue, queue.peek())
    }
    
    func test_어떤값이_들어간_queue에서_peek를하면_그값은_앞에서들어간_값이다() {
        //given
        queue.enqueue(value: 3)
        
        //when
        let value = queue.peek()
        
        //then
        XCTAssertEqual(value, 3)
    }
    
    func test_여러개의_값들이_들어간_queue에서_clear를하면_queue는_비어있다() {
        //given
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.enqueue(value: 3)
        
        //when
        queue.clear()
        
        //then
        XCTAssertTrue(queue.isEmpty)
    }
    
    func test_여러개의_값들이_들어간_queue에서_isEmpty는_false다() {
        //given, when
        queue.enqueue(value: 1)
        queue.enqueue(value: 2)
        queue.enqueue(value: 3)
        
        //then
        XCTAssertFalse(queue.isEmpty)
    }
}
