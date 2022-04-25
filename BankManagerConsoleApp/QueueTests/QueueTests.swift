//
//  QueueTests.swift
//  QueueTests
//
//  Created by song on 2022/04/25.
//

import XCTest

class QueueTests: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue_함수를_호출하면_isEmpty가_false가_되는지() {
        //when
        let someNumber = 2
        //then
        sut.enqueue(data: someNumber)
        //given
        XCTAssertEqual(sut.isEmpty, false)
    }
    
    func test_dequeue_함수를_호출하면_isEmpty가_true가_되는지() {
        //when
        let someNumber = 2
        //then
        sut.enqueue(data: someNumber)
        let _ = sut.dequeue()
        //given
        XCTAssertEqual(sut.isEmpty, true)
    }
    
    func test_peek_함수를_호출하면_값이있을때_첫번째값이_나오는지() {
        //when
        let firstNumber = 2
        let secondNumber = 3
        //then
        sut.enqueue(data: firstNumber)
        sut.enqueue(data: secondNumber)
        let result = sut.peek()
        //given
        XCTAssertEqual(result, firstNumber)
    }
    
    func test_peek_함수를_호출하면_값이없을때_nil이_나오는지() {
        //then
        let result = sut.peek()
        //given
        XCTAssertEqual(result, nil)
    }
    
    func test_clear_함수를_호출하면_isEmpty가_true가_되는지() {
        //when
        let someNumber = 2
        //then
        sut.enqueue(data: someNumber)
        sut.clear()
        //given
        XCTAssertEqual(sut.isEmpty, true)
    }
}
