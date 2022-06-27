//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by LeeChiheon on 2022/06/27.
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

    func test_enqueue함수가_잘돌아가는지() {
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
    
    func test_dequeue함수가_데이터를잘뽑는지() {
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
}
