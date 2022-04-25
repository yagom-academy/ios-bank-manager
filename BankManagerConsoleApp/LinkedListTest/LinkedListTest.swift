//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Donnie, Safari on 2022/04/25.
//

import XCTest

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList<Int>()
    }
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Node_1개_append_했을때_isEmmpy는_false() {
        
        //given
        sut?.append(1)
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_non_append_했을때_isEmmpy는_true() {
        
        //given
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_Node_1개_append_removeFirst_후_peek_호출_결과_nil() {
        //given
        sut.append(1)
        sut.removeFirst()
        
        //when
        let result = sut.peek()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_value_data_removeFirst_호출_결과_Equal_data() {
        //given
        let data = 1
        sut.append(data)
                
        //when
        let result = sut.removeFirst()
        
        //then
        XCTAssertEqual(result, data)
    }
    
    func test_non_append_removeFirst_호출_결과_nil() {
        //given
                
        //when
        let result = sut.removeFirst()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_Node_2개_append_removeFirst_호출_결과_첫번째_Node_velue() {
        //given
        sut.append(1)
        sut.append(2)
                
        //when
        let result = sut.removeFirst()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
}
