//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by ehd on 2021/07/30.
//

import XCTest
@testable import BankManagerConsoleApp

class BankManagerConsoleAppTests: XCTestCase {
    var queue = Queue<Double>()
    
    func test_큐가비어있으면트루인지() {
        let 큐 = queue.isEmpty()
        XCTAssertEqual(큐, true)
    }

    func test_큐에하나의노드를인큐했을때_큐안의노드의데이터가_인큐한노드의데이터인지() {
        let 노드 = Node<Double>(data: 1.1)
        queue.Enqueue(node: 노드)
        let 헤드의데이터 = queue.linkedList.head?.data
        XCTAssertEqual(헤드의데이터, 노드.data)
    }

    func test_큐에여러개의노드를인큐했을때_큐안에서그노드들이순서대로위치하는지() {
        let 노드1 = Node<Double>(data: 1.1)
        let 노드2 = Node<Double>(data: 1.2)
        let 노드3 = Node<Double>(data: 1.3)
        queue.Enqueue(node: 노드1)
        queue.Enqueue(node: 노드2)
        queue.Enqueue(node: 노드3)
        let 노드1의데이터 = queue.linkedList.head?.data
        let 노드2의데이터 = queue.linkedList.head?.next?.data
        let 노드3의데이터 = queue.linkedList.head?.next?.next?.data
        XCTAssertEqual(노드1의데이터, 노드1.data)
        XCTAssertEqual(노드2의데이터, 노드2.data)
        XCTAssertEqual(노드3의데이터, 노드3.data)
    }

    func test_큐에노드1개를인큐한후_디큐했을때_큐가비었는지() {
        let 노드 = Node<Double>(data: 1.1)
        queue.Enqueue(node: 노드)
        queue.dequeue()
        XCTAssertEqual(queue.isEmpty(), true)
    }

    func test_큐에노드여러개를인큐한후_디큐할때마다_인큐한순서대로노드가잘디큐되는지() {
        let 노드1 = Node<Double>(data: 1.1)
        let 노드2 = Node<Double>(data: 1.2)
        let 노드3 = Node<Double>(data: 1.3)
        queue.Enqueue(node: 노드1)
        queue.Enqueue(node: 노드2)
        queue.Enqueue(node: 노드3)
        queue.dequeue()
        XCTAssertEqual(queue.linkedList.head?.data, 노드2.data)
        XCTAssertEqual(queue.linkedList.head?.next?.data, 노드3.data)
        queue.dequeue()
        XCTAssertEqual(queue.linkedList.head?.data, 노드3.data)
        queue.dequeue()
        XCTAssertEqual(queue.isEmpty(), true)
    }

    func test_큐에노드여러개를인큐한후_피크했을때_맨처음인큐한노드인지() {
        let 노드1 = Node<Double>(data: 1.1)
        let 노드2 = Node<Double>(data: 1.2)
        let 노드3 = Node<Double>(data: 1.3)
        queue.Enqueue(node: 노드1)
        queue.Enqueue(node: 노드2)
        queue.Enqueue(node: 노드3)
        let 피크한노드의데이터 = queue.peek()?.data
        XCTAssertEqual(피크한노드의데이터, 노드1.data)
    }
    func test_큐에여러개의노드를인큐한후_클리어했을때_큐가비어있는지() {
        let 노드1 = Node<Double>(data: 1.1)
        let 노드2 = Node<Double>(data: 1.2)
        let 노드3 = Node<Double>(data: 1.3)
        queue.Enqueue(node: 노드1)
        queue.Enqueue(node: 노드2)
        queue.Enqueue(node: 노드3)
        queue.clear()
        XCTAssertEqual(queue.isEmpty(), true)
    }
}
