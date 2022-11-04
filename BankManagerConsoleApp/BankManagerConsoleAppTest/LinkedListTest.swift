//
//  LinkedListTest.swift
//  QueueTest
//
//  Created by 애쉬, 로빈 on 2022/11/02.
//

import XCTest

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func test_count가0인list에insertFirst를호출했을때_head값이_2인지() {
        // given
        sut.insertFirst(2)
        
        // when
        let result = sut.head?.value
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_count가1인list에insertFirst를호출했을때_head값이_10인지() {
        // given
        sut.insertLast(5)
        sut.insertFirst(10)
        
        // when
        let result = sut.head?.value
        
        // then
        XCTAssertEqual(result, 10)
    }
    
    func test_count가2인list에insertFirst를호출했을때_head값이_3인지() {
        // given
        sut.insertLast(1)
        sut.insertLast(2)
        sut.insertFirst(3)
        
        // when
        let result = sut.head?.value
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_count가0인list에서search를호출했을때_반환값이_nil인지() {
        // given
        // when
        let result = sut.search(3)
        
        // then
        XCTAssertNil(result)
    }
    
    func test_count가1이고_노드값이3이들어있는_list에서search3를호출했을때_반환값이_3인지() {
        // given
        sut.insertLast(3)
        
        // when
        let result = sut.search(3)?.value
        
        // then
        XCTAssertEqual(result, 3)
    }
    
    func test_노드값7이들어있는_list에서_search7를호출했을때_반환값이_7인지() {
        // given
        sut.insertLast(3)
        sut.insertLast(5)
        sut.insertLast(7)
        
        // when
        let result = sut.search(7)?.value
        
        // then
        XCTAssertEqual(result, 7)
    }
    
    func test_count가0인list에서remove를호출했을때_반환값이_nil인지() {
        // given
        // when
        let result = sut.remove(2)
        
        // then
        XCTAssertNil(result)
    }
    
    func test_count가1이고_노드값2가들어있는list에서remove2를호출했을때_반환값이_2인지() {
        // given
        sut.insertFirst(2)
        
        // when
        let result = sut.remove(2)
        
        // then
        XCTAssertEqual(result, 2)
    }
    
    func test_노드값1이들어있는list에서remove1를호출했을때_반환값이_1인지() {
        // given
        sut.insertLast(1)
        sut.insertLast(2)
        sut.insertLast(3)
        
        // when
        let result = sut.remove(1)
        
        // then
        XCTAssertEqual(result, 1)
    }
}
