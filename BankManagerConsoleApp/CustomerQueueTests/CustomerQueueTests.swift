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
    
    private var sut: Queue!

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
        let node = Node(data: element)
        let list = List(head: node, tail: node)
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
        let node = Node(data: element)
        let list = List(head: node, tail: node)
        sut = Queue(list: list)
        
        // when
        let result = sut.isEmpty
        
        // then
        XCTAssertFalse(result)
    }

    func test_Queue에1과2를enQueue했을때_1이Queue의첫번째값이되고2가마지막값이된다() {
        // given
        let firstElement = 1
        let secondElemnet = 2
        
        // when
        sut.enqueue(firstElement)
        sut.enqueue(secondElemnet)
        
        // then
        XCTAssertEqual(sut.dequeue(), firstElement)
        XCTAssertEqual(sut.dequeue(), secondElemnet)
    }
    
    func test_Queue에값이없을때_deQueue했을때_nil을반환된다() {
        // given
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_Queue에값이있을때_deQueue했을때_첫번째값이반환된다() {
        // given
        let firstElement = 2
        let secondElement = 1
        let secondNode = Node(data: secondElement)
        let firstNode = Node(data: firstElement, next: secondNode)
        let list = List(head: firstNode, tail: secondNode)
        sut = Queue(list: list)
        
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertEqual(result, firstElement)
    }
    
    func test_Queue에값이있을때_clear호출시_isEmpty가true가된다() {
        // given
        let firstElement = 2
        let secondElement = 1
        let secondNode = Node(data: secondElement)
        let firstNode = Node(data: firstElement, next: secondNode)
        let list = List(head: firstNode, tail: secondNode)
        sut = Queue(list: list)
        
        // when
        sut.clear()
        
        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
