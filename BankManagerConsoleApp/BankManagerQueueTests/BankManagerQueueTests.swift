//
//  BankManagerQueueTests.swift
//  BankManagerQueueTests
//
//  Created by brody, christy, harry on 2023/03/06.
//

import XCTest

final class BankManagerQueueTests: XCTestCase {
    private var sut: BankManagerQueue<Int>!
    
    override func setUp() {
        let linkedList = LinkedList<Int>()
        sut = BankManagerQueue.init(linkedList: linkedList)
    }
    
    override func tearDown() {
        sut = nil
    }

    func test_큐가비어있을때_enqueue로_5를추가하면_linkedList의_head의_값은5다() {
        // given
        let value = 5
        let expectation = 5
        
        // when
        sut.enqueue(value)
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐에5가있을때_enqueue로_3을추가하면_linkedList의_head의_값은5다() {
        // given
        let value = 5
        let expectation = 5
        sut.enqueue(value)
        
        // when
        let input = 3
        sut.enqueue(input)
        let result = sut.peek
        
        // then
        XCTAssertEqual(result, expectation)
    }
    
    func test_큐가비어있을때_dequeue를_호출하면_nil을반환한다() {
        // when
        let result = sut.dequeue()
        
        // then
        XCTAssertNil(result)
    }
    
    func test_큐에5가있을때_dequeue를_호출하면_5가반환되고_isEmpty는_true이다() {
        // given
        let headNode = Node(value: 5)
        let tailNode = headNode
        let linkedList = LinkedList(head: headNode, tail: tailNode)
        sut = BankManagerQueue(linkedList: linkedList)
        let dequeueExpectation = 5
        
        // when
        let returnResult = sut.dequeue()
        
        // then
        XCTAssertEqual(returnResult, dequeueExpectation)
        XCTAssertTrue(sut.isEmpty)
    }
    
    func test_큐에5와6과7이있을때_clear를_호출하면_isEmpty는true다() {
        // given
        let headNode = Node(value: 5)
        let centerNode = Node(value: 6)
        let tailNode = Node(value: 7)
        headNode.next = centerNode
        centerNode.next = tailNode
        let linkedList = LinkedList(head: headNode, tail: tailNode)
        sut = BankManagerQueue(linkedList: linkedList)
        
        // when
        sut.clear()
        
        //then
        XCTAssertTrue(sut.isEmpty)
    }
}
