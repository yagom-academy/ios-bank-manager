//
//  CustomerQueueTests.swift
//  CustomerQueueTests
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

import XCTest

class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Customer>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_큐의요소가비어있을때_빈값으로확인이되는지() {
        // given

        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_큐의요소가비어있을때_dequeue를하면_nil이반환되는지() {
        // given
        
        // when
        let result = sut.dequeue()
        // then
        XCTAssertNil(result)
    }
    
    func test_큐에값을3개넣어줄때_dequeue를하면_첫번째값이_제거되고반환되는지() {
        // given
        let firstValue = Customer(number: 3)
        let secondValue = Customer(number: 5)
        let thirdValue = Customer(number: 7)
        
        sut = CustomerQueue(elements: [firstValue, secondValue, thirdValue])
        let expectation = [secondValue, thirdValue]
        // when
        let firstItem = sut.dequeue()
        let currentList = sut.currentList
        
        // then
        XCTAssertEqual(firstValue, firstItem)
        XCTAssertEqual(expectation, currentList)
        
    }

    func test_큐에값을2개넣어줄때_peek을하면_첫번째값이반환되는지() {
        // given
        let firstValue = Customer(number: 3)
        let secondValue = Customer(number: 7)
        sut = CustomerQueue(elements: [firstValue, secondValue])
        // when
        let result = sut.peek
        // then
        XCTAssertEqual(firstValue, result)
    }
    
    func test_큐에값을2개넣어줄때_peek을여러번해도_똑같은값이_반환되는지() {
        // given
        let firstValue = Customer(number: 3)
        let secondValue = Customer(number: 7)
        sut = CustomerQueue(elements: [firstValue, secondValue])
        // when
        let result = sut.peek
        let result2 = sut.peek
        // then
        XCTAssertEqual(result, result2)
    }
    
    func test_큐에값을3개넣어줄때_clear를하면_빈큐가되는지() {
        // given
        let firstValue = Customer(number: 3)
        let secondValue = Customer(number: 7)
        let thirdValue = Customer(number: 5)
        sut = CustomerQueue(elements: [firstValue,secondValue,thirdValue])
        sut.clear()
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
}
