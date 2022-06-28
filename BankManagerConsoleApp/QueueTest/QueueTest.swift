//
//  QueueTest.swift
//  QueueTest
//
//  Created by LeeChiheon on 2022/06/28.
//

import XCTest

class QueueTest: XCTestCase {

    var sut: Queue<Int>?
    
    override func setUpWithError() throws {
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue함수에데이터를넣으면_배열에순서대로잘들어가는지1() {
        // given
        let input = [1,2,3,4,5]
        
        // when
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        let result: Queue<Int> = [1, 2, 3, 4]
        
        // then
        XCTAssertEqual(sut, result)
    }
    
    func test_enqueue함수에데이터를넣으면_배열에순서대로잘들어가는지2() {
        // given
        let input = [1,2,3,4,5]
        
        // when
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        let result: Queue<Int> = [1, 2, 3, 4, 5]
        
        // then
        XCTAssertFalse(sut == result)
    }
    
    func test_dequeue함수가_배열의마지막숫자를잘반환하는지() {
        // given
        let input = [1,2,3,4,5]
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        
        // when
        let result = sut?.dequeue()
        
        // then
        XCTAssertEqual(input[0], result)
    }
    
    func test_clear() {
        // given
        let input = [1,2,3,4,5]
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        
        // when
        sut?.clear()
        let result = true
        
        //then
        XCTAssertEqual(result, sut?.isEmpty)
    }
    
    func test_peek잘_동작하는지_확인() {
        // given
        let input = [1,2,3,4,5]
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        
        // when
        let result = 1
        
        // then
        XCTAssertEqual(sut?.peek, result)
    }
    
    func test_isEmpty잘_동작하는지_확인() {
        // given
        let input = [1,2,3,4,5]
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        
        // when
        sut?.clear()
        guard let result = sut?.isEmpty else { return }
        
        // then
        XCTAssertTrue(result)
    }
}
