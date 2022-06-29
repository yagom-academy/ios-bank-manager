//
//  CustomerQueueTests.swift
//  CustomerQueueTests
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

import XCTest

class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_초기상태일때_isEmpty의반환값이true인지() {
        // given
        
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_초기상태일때_dequeue를하면_nil이반환되는지() {
        // given
        
        // when
        let result = sut.dequeue()
        // then
        XCTAssertNil(result)
    }
    
    func test_3과7과5를넣었을때_dequeue의반환값이3인지() {
        // given
        let expectation = 3
        sut = CustomerQueue(elements: [3, 5, 7])
        
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueue로3과7을넣었을때_peek이3인지() {
        // given
        let expectation = 3
        sut = CustomerQueue(elements: [3, 7])
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(expectation, result)
    }
    
    func test_enqueue로3과7을넣었을때_peek을여러번해도_똑같은값이_나오는지() {
        // given
        sut = CustomerQueue(elements: [3, 7])
        // when
        let result = sut.peek
        let result2 = sut.peek
        // then
        XCTAssertEqual(result, result2)
    }
    
    func test_3과7과5를넣었을때_clear후peek이nil인지() {
        // given
        sut = CustomerQueue(elements: [3, 7, 5])
        sut.clear()
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(result, nil)
    }
    
    func test_3과7과5를넣었을때_dequeue3번후isEmpty가true인지() {
        // given
        sut = CustomerQueue(elements: [3, 7, 5])
        sut.dequeue()
        sut.dequeue()
        sut.dequeue()
        // when
        let result = sut.isEmpty
        // then
        XCTAssertEqual(result, true)
    }
}
