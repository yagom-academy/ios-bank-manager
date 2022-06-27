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
        // then
        print(sut?.head?.data)
        print(sut?.head?.next?.data)
        print(sut?.head?.next?.next?.data)
        print(sut?.head?.next?.next?.next?.data)
    }
}
