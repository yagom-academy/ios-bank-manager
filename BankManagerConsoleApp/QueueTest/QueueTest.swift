//
//  QueueTest.swift
//  QueueTest
//
//  Created by finnn, bard on 2022/06/28.
//

import XCTest

class QueueTest: XCTestCase {
    var sut: Queue<Int>?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
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
        let result: String = "\([1, 2, 3, 4])"
        
        // then
        XCTAssertEqual(sut?.debugDescription, result)
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
    
    func test_enqueue함수에데이터를넣으면_배열에순서대로잘들어가는지3() {
        // given
        let input = [1,2,3,4,5]
        
        // when
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        let result: Queue<Int> = [1, 2, 3]
        
        // then
        XCTAssertFalse(sut == result)
    }
    
    func test_enqueue를했을때_debugDescription이enqueu한값을잘반환하는지1() {
        // given
        let input = [1,2,3,4,5]
        
        // when
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        let result: String = "\([1, 2, 3, 4])"
        
        // then
        XCTAssertTrue(sut?.debugDescription == result)
    }
    
    func test_enqueue를했을때_debugDescription이enqueu한값을잘반환하는지2() {
        // given
        let input = [1,2,3,4,5]
        
        // when
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        let result: String = "\([1, 2, 3])"
        
        // then
        XCTAssertFalse(sut?.debugDescription == result)
    }
    
    func test_dequeue함수가_배열의첫번째숫자를잘반환하는지() {
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
    
    func test_clear함수를실행하면큐내부가비어있는지() {
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
        XCTAssertEqual(sut?.isEmpty, result)
    }
    
    func test_peek잘_동작하는지_확인1() {
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
    
    func test_peek잘_동작하는지_확인2() {
        // given
        let input = [1,2,3,4,5]
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        let dequeuedData = sut?.dequeue()
        
        // when
        let result = 2
        
        // then
        XCTAssertEqual(sut?.peek, result)
    }
    
    func test_peek잘_동작하는지_확인() {
        // given
        let input = [1,2,3,4,5]
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        let dequeuedData1 = sut?.dequeue()
        let dequeuedData2 = sut?.dequeue()
        
        // when
        let result = 3
        
        // then
        XCTAssertEqual(sut?.peek, result)
    }
    
    func test_clear함수를실행하고_배열과_비교해서_true와_false를_잘_반환하는지() {
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
        if result  {
            XCTAssertTrue(result)
        } else {
            XCTAssertFalse(result)
        }
    }
}
