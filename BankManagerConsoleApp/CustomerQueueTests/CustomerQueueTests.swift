//
//  CustomerQueueTests.swift
//  CustomerQueueTests
//
//  Created by jyubong, Toy on 11/14/23.
//

import XCTest
@testable import BankManagerConsoleApp

final class CustomerQueueTests: XCTestCase {
    typealias List = LinkedList<Int>
    typealias Queue = CustomerQueue<Int>
    
    var sut: Queue!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue(list: List())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Queue에값이없을때_peek호출시_nil이반환된다() {
        // given
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertNil(result)
    }

    func test_Queue에1을할당할때_peek호출시_1이반환된다() {
        // given
        let element = 1
        let list = List(head: .init(data: element), tail: .init(data: element))
        sut = Queue(list: list)
        
        // when
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, element)
    }
    
    func test_Queue에값이없을때_isEmpty호출시_true가반환된다() {
        // given
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_Queue에값이있을때_isEmpty호출시_false가반환된다() {
        // given
        let element = 1
        let list = List(head: .init(data: element), tail: .init(data: element))
        sut = Queue(list: list)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }

    func test_Queue에1과2를enQueue했을때_1이Queue의첫번째값이고2가Queue의마지막값이다() {
        // given
        let firstElement = 1
        let secondElemnet = 2
        
        // when
        sut.enqueue(firstElement)
        sut.enqueue(secondElemnet)
        
        // then
        XCTAssertEqual(sut.peek, firstElement)
        XCTAssertNotEqual(sut.peek, secondElemnet)
    }
}
