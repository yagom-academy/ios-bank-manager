//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by finnn, bard on 2022/06/27.
//

import XCTest

class LinkedListTest: XCTestCase {

    var sut: LinkedList<Int>?
    
    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_enqueue함수에데이터를넣으면_배열에순서대로잘들어가는지() {
        // given
        let input = [1,2,3,4,5]
        
        // when
        sut?.enqueue(data: input[0])
        sut?.enqueue(data: input[1])
        sut?.enqueue(data: input[2])
        sut?.enqueue(data: input[3])
        let result = [1, 2, 3, 4]
        guard let data = sut?.head?.data else { return }
        
        // then
        XCTAssertEqual(data, result[0])
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
        let result = 0
        
        //then
        XCTAssertEqual(result, sut?.nodeCount)
    }
}
