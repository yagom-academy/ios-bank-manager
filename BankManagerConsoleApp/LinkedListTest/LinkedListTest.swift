//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by 리지, 무리 on 2023/03/06.
//

import XCTest

final class LinkedListTest: XCTestCase {
    var sut: LinkedList<String>!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<String>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    //MARK: - isEmpty test
    func test_값이없는경우_isEmpty가_true다() {
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    //MARK: - peek test
    func test_append된값이_있을때_peek접근시_첫번째값을_반환한다() {
        // given
        sut.append("11")
        sut.append("12")
        let expectation = "11"
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    //MARK: - append test

    func test_값이있는경우_isEmpty가_false다() {
        // given
        sut.append("1")
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }
    
    //MARK: - removeFirst test
    func test_append된값이없을때_removeFirst실행시_nil을반환한다() {
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_append된값이_1_2_3_일때_removeFirst실행시_1을반환한다() {
        // given
        sut.append("1")
        sut.append("2")
        sut.append("3")
        let expectation = "1"
        
        // when
        let result = sut.removeFirst()
        
        // then
        XCTAssertEqual(result, expectation)
    }

    func test_append된값이_있을때_removeFirst실행시_head가_변경된다() {
        // given
        sut.append("4")
        sut.append("5")
        sut.append("6")
        let expectation = "5"
        
        // when
        let _ = sut.removeFirst()
        let result = sut.head?.data
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_append된값이_있을때_removeFirst실행시_append된순서대로_값을_반환한다() {
        // given
        sut.append("4")
        sut.append("5")
        let expectation = "4"
        let expectation2 = "5"
        
        // when
        let result = sut.removeFirst()
        let result2 = sut.removeFirst()
        
        // then
        XCTAssertEqual(result, expectation)
        XCTAssertEqual(result2, expectation2)
    }
    
    //MARK: - removeAll test
    func test_removeAll실행시_isEmpty는_true다() {
        // given
        sut.append("10")
        sut.append("20")
   
        // when
        sut.removeAll()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
 }

