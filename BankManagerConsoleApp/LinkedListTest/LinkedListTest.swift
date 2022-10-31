//
//  LinkedListTest.swift
//  Created by sunnycookie, inho
//

import XCTest
@testable import BankManagerConsoleApp

class LinkedListTest: XCTestCase {
    var sut: LinkedList<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_append메서드호출시_head가없으면_입력값이head로지정() {
        //give, when
        sut.append(3)
        
        //then
        let result = sut.head?.data
        XCTAssertEqual(3, result)
    }
    
    func test_append메서드호출시_입력값이_다음노드로지정() {
        //given
        sut.append(1)
        sut.append(2)
        
        //when
        let result = sut.head?.next?.data
        
        //then
        XCTAssertEqual(2, result)
    }
    
    func test_last프로퍼티호출시_head가없으면_nil을반환() {
        //give, when
        let result = sut.last
        
        //then
        XCTAssertNil(result)
    }
    
    func test_last프로퍼티호출시_마지막데이터를반환() {
        //given
        sut.append(1)
        sut.append(2)
        sut.append(3)

        //when
        let result = sut.last?.data

        //then
        XCTAssertEqual(3, result)
    }
    
    func test_isEmpty프로퍼티호출시_head가없으면_true를반환() {
        //give, when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_isEmpty프로퍼티호출시_데이터가있으면_false를반환() {
        //given
        sut.append(1)
        sut.append(2)
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_removeFirst메서드호출시_head가없으면_nil을반환() {
        //give, when
        let result = sut.removeFirst()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_removeFirst메서드호출시_첫번째데이터를반환() {
        //given
        sut.append(1)
        sut.append(2)
        sut.append(3)
        
        //when
        let result = sut.removeFirst()
        
        //then
        XCTAssertEqual(1, result)
    }
    
    func test_removeAll메서드호출시_head가_nil로지정() {
        //given
        sut.append(1)
        sut.append(2)
        
        //when
        sut.removeAll()
        
        //then
        XCTAssertNil(sut.head)
    }
}
