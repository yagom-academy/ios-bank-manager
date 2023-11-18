//
//  CustomerQueueTests.swift
//  CustomerQueueTests
//
//  Created by Kiseok on 11/14/23.
//

import XCTest
@testable import BankManager

final class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>!
    let linkedList: LinkedList<Int> = LinkedList()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue(queue: linkedList)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_queue가비어있을때_isEmpty호출시_true를반환하는지() {
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertTrue(result)
    }
    
    func test_queue가비어있지않을때_isEmpty호출시_false를반환하는지() {
        //given
        sut.enqueue(data: 1)
        
        //when
        let result = sut.isEmpty
        
        //then
        XCTAssertFalse(result)
    }
    
    func test_queue에1을enqueue했을때_queue의head호출시_1이나오는지() {
        //given
        sut.enqueue(data: 1)
        
        //when
        let result = sut.queue.head?.data
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue에1과2를enqueue했을때_queue의head호출시_1이나오는지() {
        //given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        //when
        let result = sut.queue.head?.data
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue가비었을때_peek호출시_nil이나오는지() {
        //when
        let result = sut.peek
        
        //then
        XCTAssertNil(result)
    }
    
    func test_queue에1이들어있을때_peek호출시_1이나오는지() {
        //given
        sut.enqueue(data: 1)
        
        //when
        let result = sut.peek
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue에1과2가들어있을때_peek호출시_1이나오는지() {
        //given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        //when
        let result = sut.peek
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue에1이있을때_dequeue호출시_1이나오는지() {
        //given
        sut.enqueue(data: 1)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue에1과2가있을때_dequeue호출시_1이나오는지() {
        //given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue가비어있을때_dequeue호출시_nil이나오는지() {
        //when
        let result = sut.dequeue()
        
        //then
        XCTAssertNil(result)
    }
    
    func test_queue에1이들어있을때_clear호출시_모두초기화되는지() {
        //given
        sut.enqueue(data: 1)
        
        //when
        sut.clear()
        
        //then
        XCTAssertNil(sut.queue.head)
        XCTAssertNil(sut.queue.tail)
    }
    
    func test_queue에1을enqueue후_count호출시_1이나오는지() {
        //given
        sut.enqueue(data: 1)
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_queue에1과2를enqueue후_count호출시_2가나오는지() {
        //given
        sut.enqueue(data: 1)
        sut.enqueue(data: 2)
        
        //when
        let result = sut.count
        
        //then
        XCTAssertEqual(result, 2)
    }

}

extension Int: CustomerProtocol {}
