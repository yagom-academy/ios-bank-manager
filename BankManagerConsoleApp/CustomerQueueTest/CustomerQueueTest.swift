//
//  CustomerQueueTest.swift
//  CustomerQueueTest
//
//  Created by dhoney96 on 2022/06/28.
//

import XCTest

class CustomerQueueTest: XCTestCase {
    var sut: CustomerQueue<Int>!
    var firstNode: Node<Int>!
    var secondNode: Node<Int>!
    var thirdNode: Node<Int>!
    var fourthNode: Node<Int>!
    var lastNode: Node<Int>!
    
    override func setUpWithError() throws {
        sut = CustomerQueue()
        firstNode = Node(1)
        secondNode = Node(2)
        thirdNode = Node(3)
        fourthNode = Node(4)
        lastNode = Node(5)
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_노드가_비어있는지_확인_비어있으면_true_반환() {
        XCTAssert(sut.isEmpty())
    }
    
    func test_노드가_비어있지않으면_false_반환() {
        sut.enqueue(inputNode: firstNode)
        
        XCTAssertFalse(sut.isEmpty())
    }
    
    func test_enqueue된_순서대로_dequeue를_통해_반환() {
        sut.enqueue(inputNode: firstNode)
        sut.enqueue(inputNode: secondNode)
        sut.enqueue(inputNode: thirdNode)
        sut.enqueue(inputNode: fourthNode)
        sut.enqueue(inputNode: lastNode)
        
        var result = [Int?]()
        result.append(sut.dequeue()?.data)
        result.append(sut.dequeue()?.data)
        result.append(sut.dequeue()?.data)
        result.append(sut.dequeue()?.data)
        result.append(sut.dequeue()?.data)
        
        XCTAssertEqual([1, 2, 3, 4, 5], result)
    }
    
    func test_clear메서드_호출시_isEmpty가_true를_반환() {
        sut.enqueue(inputNode: firstNode)
        sut.enqueue(inputNode: secondNode)
        sut.enqueue(inputNode: thirdNode)
        sut.enqueue(inputNode: fourthNode)
        sut.enqueue(inputNode: lastNode)
        
        sut.clear()
        
        XCTAssertTrue(sut.isEmpty())
    }
    
    func test_노드가_하나일때_peek_사용시_노드의_data_반환() {
        sut.enqueue(inputNode: firstNode)
        
        XCTAssertEqual(1, sut.head?.data)
    }
}
