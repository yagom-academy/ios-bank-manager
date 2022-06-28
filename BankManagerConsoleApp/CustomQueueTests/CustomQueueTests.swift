//
//  CustomQueueTests.swift
//  CustomQueueTests
//
//  Created by 수꿍, 브래드 on 2022/06/28.
//

import XCTest

class CustomQueueTests: XCTestCase {
    var sut = CustomerQueue<Int>()
    var stringSut = CustomerQueue<String>()
    
    func test_enqueue_양의_정수가_순서대로_들어가는지_테스트() throws {
        // given
        let input1: Int = 1
        let input2: Int = 9999
        
        // when
        sut.enqueue(data: input1)
        sut.enqueue(data: input2)
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()
        
        // then
        XCTAssertEqual(result1, input1)
        XCTAssertEqual(result2, input2)
    }

    func test_dequeue_양의_정수가_순서대로_나오는지_테스트() throws {
        // given
        let input1: Int = 1
        let input2: Int = 9999
        sut.enqueue(data: input1)
        sut.enqueue(data: input2)
        
        // when
        let result1 = sut.dequeue()
        let result2 = sut.dequeue()
        
        // then
        XCTAssertEqual(result1, input1)
        XCTAssertEqual(result2, input2)
    }
    
    func test_clear_CustomerQueue내의_모든_요소가_삭제되는지_테스트() throws {
        // given
        let input1: Int = 1
        let input2: Int = 9999
        let input3: Int = 99999
        let input4: Int = 999999
        let input5: Int = 1000000
        sut.enqueue(data: input1)
        sut.enqueue(data: input2)
        sut.enqueue(data: input3)
        sut.enqueue(data: input4)
        sut.enqueue(data: input5)
        
        // when
        let _ = sut.clear()
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_enqueue_문자열이_순서대로_들어가는지_테스트() throws {
        // given
        let input1: String = "가"
        let input2: String = "나"
        
        // when
        stringSut.enqueue(data: input1)
        stringSut.enqueue(data: input2)
        let result1 = stringSut.dequeue()
        let result2 = stringSut.dequeue()
        
        // then
        XCTAssertEqual(result1, input1)
        XCTAssertEqual(result2, input2)
    }
    
    func test_peek_dequeue를_진행하면_peek가_정상적으로_바뀌는지_테스트() throws {
        // given
        let input1: String = "가"
        let input2: String = "나"
        
        // when
        stringSut.enqueue(data: input1)
        stringSut.enqueue(data: input2)
        let _ = stringSut.dequeue()
        let result = stringSut.peek
        
        // then
        XCTAssertEqual(result, input2)
    }
    
    func test_isEmpty_queue에_값이_남아있을때_isEmpty가_false를_반환하는지_테스트() throws {
        // given
        let input: String = "가"
        
        // when
        stringSut.enqueue(data: input)
        let result = stringSut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_dequeue_빈_queue에_dequeue를_실행하였을때_nil을_반화하는지_테스트() throws {
        // given, when
        let result = stringSut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
}
