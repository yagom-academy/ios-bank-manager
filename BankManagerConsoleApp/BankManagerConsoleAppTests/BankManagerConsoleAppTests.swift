//
//  BankManagerConsoleAppTests.swift
//  BankManagerConsoleAppTests
//
//  Created by Luyan, Marco on 2021/07/27.
//

@testable import BankManagerConsoleApp
import XCTest

class BankManagerConsoleAppTests: XCTestCase {
    var sutLinkedList = LinkedList<Int>()

    // MARK: --- LinkedList UnitTest
    func test_실패케이스_링크드리스트의_push메서드를_호출하면_head노드에_새노드가추가된다() {
        // given
        let inputNumber = 1
        // when
        sutLinkedList.push(inputNumber)
        // then
        XCTAssertNotEqual(sutLinkedList.first?.value, nil)
    }
    
    func test_성공케이스_링크드리스트의_push메서드를_호출하면_head노드에_새노드가추가된다() {
        // given
        let inputNumber = 1
        // when
        sutLinkedList.push(inputNumber)
        // then
        XCTAssertEqual(sutLinkedList.first?.value, inputNumber)
    }
    
    func test_실패케이스_링크드리스트의_append메서드를_호출하면_tail노드에_새노드가추가된다() {
        // given
        let inputNumber = 1
        // when
        sutLinkedList.append(inputNumber)
        // then
        XCTAssertNotEqual(sutLinkedList.peekLastNode()?.value, nil)
    }
    
    func test_성공케이스_링크드리스트의_append메서드를_호출하면_taii노드에_새노드가추가된다() {
        // given
        let inputNumber = 1
        // when
        sutLinkedList.append(inputNumber)
        // then
        XCTAssertEqual(sutLinkedList.peekLastNode()?.value, inputNumber)
    }
    
    func test_실패케이스_링크드리스트의_clear을하면_노드의개수가_0이_나온다() {
        // given
        var dummyNodes = [
            DummyNode(value: 1, weakPointer: nil),
            DummyNode(value: 2, weakPointer: nil),
            DummyNode(value: 3, weakPointer: nil),
            DummyNode(value: 4, weakPointer: nil)
        ]
        dummyNodes.enumerated().forEach({ value in
            sutLinkedList.append(value.element.value)
            dummyNodes[value.offset].weakPointer = sutLinkedList.peekLastNode()
        })
        // when
        sutLinkedList.clear()
        let result = dummyNodes.filter({ $0.weakPointer != nil }).count
        // then
        XCTAssertNotEqual(result, 4)
    }
    
    func test_성공케이스_링크드리스트의_clear을하면_노드의개수가_0이_나온다() {
        // given
        var dummyNodes = [
            DummyNode(value: 1, weakPointer: nil),
            DummyNode(value: 2, weakPointer: nil),
            DummyNode(value: 3, weakPointer: nil),
            DummyNode(value: 4, weakPointer: nil)
        ]
        dummyNodes.enumerated().forEach({ value in
            sutLinkedList.append(value.element.value)
            dummyNodes[value.offset].weakPointer = sutLinkedList.peekLastNode()
        })
        // when
        sutLinkedList.clear()
        let result = dummyNodes.filter({ $0.weakPointer != nil }).count
        // then
        XCTAssertEqual(result, 0)
    }
    
    func test_실패케이스_링크드리스트의_popFirst메서드를_호출하면_head노드를_pop한다() {
        // given

        // when
        let popFirst = sutLinkedList.popFirst()
        // then
        XCTAssertEqual(popFirst, nil)
    }
    
    func test_성공케이스_링크드리스트의_popFirst메서드를_호출하면_head노드를_pop한다() {
        // given
        let inputNumber = 1
        sutLinkedList.push(inputNumber)
        // when
        let popFirst = sutLinkedList.popFirst()!
        // then
        XCTAssertEqual(popFirst, inputNumber)
    }
    
    // MARK: --- Queue UnitTest
    var sutQueue = Queue<Int>()
    
    func test_실패케이스_큐의_enqueue메서드를_호출하면_큐의_list의_tail노드에_새노드가추가된다() {
        // given
        let inputNumber = 1
        // when
        sutQueue.enqueue(inputNumber)
        // then
        XCTAssertNotEqual(sutQueue.peek!, 0)
    }
    
    func test_성공케이스_큐의_enqueue메서드를_호출하면_큐의_list의_taii노드에_새노드가추가된다() {
        // given
        let inputNumber = 1
        // when
        sutQueue.enqueue(inputNumber)
        // then
        XCTAssertEqual(sutQueue.peek!, inputNumber)
    }
    
    func test_실패케이스_큐의_dequeue메서드를_호출하면_큐의_list의_head노드가_pop한다() {
        // given

        // when
        let pop = sutQueue.dequeue()
        // then
        XCTAssertEqual(pop, nil)
    }
    
    func test_성공케이스_큐의_dequeue메서드를_호출하면_큐의_list의_head노드가_pop한다() {
        // given
        let inputNumber = 1
        sutQueue.enqueue(inputNumber)
        // when
        let pop = sutQueue.dequeue()!
        // then
        XCTAssertEqual(pop, inputNumber)
    }
    
    func test_실패케이스_큐의_clear메서드를_호출하면_큐의_list의_모든노드가_제거된다() {
        // given
        let inputNumber = 1
        sutQueue.enqueue(inputNumber)
        // when
        sutQueue.clear()
        // then
        XCTAssertFalse(!sutQueue.isEmpty)
    }
    
    func test_성공케이스_큐의_clear메서드를_호출하면_큐의_list의_모든노드가_제거된다() {
        // given
        let inputNumber = 1
        sutQueue.enqueue(inputNumber)
        // when
        sutQueue.clear()
        // then
        XCTAssertTrue(sutQueue.isEmpty)
    }
}

struct DummyNode {
    let value: Int
    weak var weakPointer: Node<Int>?
}

extension Node: Equatable where T: Numeric {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

extension LinkedList {
    func peekLastNode() -> Node<T>? {
        var current = self.first
        while current?.next != nil {
            current = current?.next
        }
        return current
    }
}


