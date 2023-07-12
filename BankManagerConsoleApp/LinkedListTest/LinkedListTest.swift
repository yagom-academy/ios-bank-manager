//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by karen on 2023/07/11.
//

import XCTest

final class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Int>()
    }
    
    //MARK: - isEmpty test
    func test_값이_없는_경우_isEmpty는_true이다() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, true)
    }
    
    //MARK: - append test
    func test_값이_있는_경우_isEmpty가_false다() {
        // given
        sut.append(1)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertEqual(result, false)
    }
    
    //MARK: - peek test
    func test_head에_데이터가_없는경우_peek에_nil이_저장된다() {
        let peek = sut.peek
        
        XCTAssertEqual(peek, nil)
    }
    
    //MARK: - peek test
    func test_append된_값이_있을때_peek접근시_첫번째_값을_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        let expectation = 1
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - removeFirst test
    func test_append된_값이_없을때_removeFirst실행시_nil을_반환한다() {
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertEqual(result, nil)
    }
    
    
    func test_append된_값이_1_2_3_일때_removeFirst실행시_1을_반환한다() {
        // given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        let expectation = 1
        
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_append된_값이_있을때_removeFirst실행시_head가_변경된다() {
        // given
        sut.append(4)
        sut.append(5)
        sut.append(6)
        let expectation = 5
        
        // when
        let _ = sut.removeFirst()
        let result = sut.headElement
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_append된_값이_있을때_removeFirst실행시_append된_순서대로_값을_반환한다() {
        // given
        sut.append(7)
        sut.append(8)
        let expectation = 7
        let expectation2 = 8
        
        // when
        let result = sut.removeFirst()
        let result2 = sut.removeFirst()
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(result2, expectation2)
    }
    
    //MARK: - clear test
    func test_clear실행시_isEmpty는_true다() {
        // given
        sut.append(10)
        sut.append(20)
   
        // when
        sut.clear()
        
        // then
        XCTAssertEqual(sut.isEmpty, true)
    }
}
