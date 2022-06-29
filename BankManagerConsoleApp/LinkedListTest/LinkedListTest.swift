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

    func test_add함수에데이터를넣으면_배열에순서대로잘들어가는지1() {
        // given
        let input = [1,2,3,4,5]
        
        // when
        sut?.add(node: Node<Int>(data: input[0]))
        sut?.add(node: Node<Int>(data: input[1]))
        sut?.add(node: Node<Int>(data: input[2]))
        sut?.add(node: Node<Int>(data: input[3]))
        let result = [1, 2, 3, 4]
        guard let data = sut?.head?.data else { return }
        
        // then
        XCTAssertEqual(data, result[0])
    }
    
    func test_add함수에데이터를넣으면_배열에순서대로잘들어가는지2() {
        // given
        let input = [1,2,3,4,5]
        
        // when
        sut?.add(node: Node<Int>(data: input[0]))
        sut?.add(node: Node<Int>(data: input[1]))
        sut?.add(node: Node<Int>(data: input[2]))
        sut?.add(node: Node<Int>(data: input[3]))
        let result = [1, 2, 3, 4]
        guard let data = sut?.head?.data else { return }
        
        // then
        XCTAssertNotEqual(data, result[2])
    }
    
    func test_removeFirst함수가_배열의첫번째숫자를잘반환하는지1() {
        // given
        let input = [1,2,3,4,5]
        sut?.add(node: Node<Int>(data: input[0]))
        sut?.add(node: Node<Int>(data: input[1]))
        sut?.add(node: Node<Int>(data: input[2]))
        sut?.add(node: Node<Int>(data: input[3]))

        // when
        let result = sut?.removeFirst()?.data
        
        // then
        XCTAssertEqual(input[0], result)
    }
    
    func test_removeFirst함수가_배열의첫번째숫자를잘반환하는지2() {
        // given
        let input = [1,2,3,4,5]
        sut?.add(node: Node<Int>(data: input[0]))
        sut?.add(node: Node<Int>(data: input[1]))
        sut?.add(node: Node<Int>(data: input[2]))
        sut?.add(node: Node<Int>(data: input[3]))

        // when
        let result = sut?.removeFirst()?.data
        
        // then
        XCTAssertNotEqual(input[2], result)
    }
    
    func test_clear함수를실행하고_isEmpty가true를반환하는지1() {
        // given
        let input = [1,2,3,4,5]
        sut?.add(node: Node<Int>(data: input[0]))
        sut?.add(node: Node<Int>(data: input[1]))
        sut?.add(node: Node<Int>(data: input[2]))
        sut?.add(node: Node<Int>(data: input[3]))
        
        // when
        sut?.clear()
        let result = 0
        
        //then
        XCTAssertEqual(sut?.nodeCount, result)
    }
    
    func test_clear함수를실행하고_isEmpty가true를반환하는지2() {
        // given
        let input = [1,2,3,4,5]
        sut?.add(node: Node<Int>(data: input[0]))
        sut?.add(node: Node<Int>(data: input[1]))
        sut?.add(node: Node<Int>(data: input[2]))
        sut?.add(node: Node<Int>(data: input[3]))
        
        // when
        sut?.clear()
        let result = 1
        
        //then
        XCTAssertNotEqual(sut?.nodeCount, result)
    }
}
