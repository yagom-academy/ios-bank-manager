//
//  BankManagerUIAppTests - BankManagerUIAppTests.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import XCTest
@testable import BankManagerUIApp

class BankManagerUIAppTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_append함수호출시_count가_1이늘어나는지() {
        // given
        let expectation = 3
        // when
        sut.append(3)
        sut.append(6)
        sut.append(120)
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    
    func test_list가비어있을때_append함수호출시_head와tail에_data가들어가는지() {
        // given
        let expectation = 2
        // when
        sut.append(2)
        // then
        XCTAssertEqual(sut.first, expectation)
        XCTAssertEqual(sut.last, expectation)
    }
    
    func test_append함수호출시_tail에_data가_올바르게들어가는지() {
        // given
        let expectationOfFirst = 6
        let expectationOfLast = -13
        // when
        sut.append(6)
        sut.append(120)
        sut.append(-13)
        // then
        XCTAssertEqual(sut.first, expectationOfFirst)
        XCTAssertEqual(sut.last, expectationOfLast)
    }
    
    func test_removeAll함수호출시_isEmpty가_true가되는지() {
        // given
        sut.append(6)
        sut.append(120)
        sut.append(-13)
        // when
        sut.removeAll()
        // then
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_list가비어있을때_removeFirst함수호출시_nil을_반환하는지() {
        // given
        let expectation: Int? = nil
        // when
        let removeElement = sut.removeFirst()
        // then
        XCTAssertEqual(expectation, removeElement)
    }
    
    func test_list의노드가_한개일때_removeFirst함수호출시_isEmpty가_true가되는지() {
        // given
        let expectation = 10
        
        sut.append(10)
        // when
        let removeElement = sut.removeFirst()
        // then
        XCTAssertEqual(expectation, removeElement)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_list의노드가_세개일때_removeFirst함수호출시_first값이나오는지() {
        // given
        sut.append(10)
        sut.append(20)
        sut.append(30)
        
        let expectation = sut.first
        // when
        let removeElement = sut.removeFirst()
        // then
        XCTAssertEqual(expectation, removeElement)
    }
}
