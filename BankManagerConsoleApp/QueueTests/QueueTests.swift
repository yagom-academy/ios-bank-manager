//
//  QueueTests.swift
//  QueueTests
//
//  Created by Jost, Hosinging 2021/07/27.
//

import XCTest

class QueueTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUp() {
        sut = Queue<Int>()
    }
    
    func test_초기상태의_큐에서_isEmpty_메서드의_리턴값은_true_이다() {
        // given
        
        // when
        let expectedResult = true
        let result = sut.isEmpty()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_큐에_enqueue_메서드를_통해_임의의_데이터를_삽입하면_isEmpty_메서드의_리턴값이_false_이다() {
        // given
        let testData = Int.random(in: 1...100)
        
        // when
        sut.enqueue(value: testData)
        let expectedResult = false
        let result = sut.isEmpty()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_초기상태의_큐에서_peek_메서드를_통해_값을_확인하면_nil_이다() {
        // given
        
        // when
        let expectedResult: Int? = nil
        let result = sut.peek()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_큐에_enqueue_메서드를_통해_정수_1_을_넣었을때_peek_메서드를_통해_값을_확인하면_정수_1_이다() {
        // given
        let testData = 1
        
        // when
        sut.enqueue(value: testData)
        let expectedResult: Int = testData
        let result = sut.peek()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_초기상태의_큐에서_dequeue_메서드를_통해_값을_추출하면_리턴값이_nil_이다() {
        // given
        
        // when
        let expectedResult: Int? = nil
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_큐에_enqueue_메서드를_통해_정수_1_을_넣었을때_dequeue_메서드를_통해_값을_추출하면_리턴값이_정수_1_이다() {
        // given
        let testData = 1
        
        // when
        sut.enqueue(value: testData)
        let expectedResult = testData
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_큐에_enqueue_메서드를_통해_정수_1_을_넣고_clear_메서드를_통해_모든값을_제거하면_큐의_isEmpty_메서드의_리턴값은_true_이다() {
        // given
        let testData = 1
        
        // when
        sut.enqueue(value: testData)
        sut.clear()
        let expectedResult = true
        let result = sut.isEmpty()
        
        // then
        XCTAssertEqual(expectedResult, result)
    }
}
