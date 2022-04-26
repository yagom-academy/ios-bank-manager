//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by OneTool, Red on 2022/04/26.
//

import XCTest

class QueueTests: XCTestCase {
    fileprivate var sut: Queue<MockList<Int>>!

    override func setUp() {
       sut = Queue(listType: MockList<Int>())
    }

    override func tearDown() {
        self.sut = nil
    }

    func test_enQueue_3번_후에_clear호출_isEmpty호출_결과가_true인지() {
        sut.enQueue(data: 1)
        sut.enQueue(data: 2)
        sut.enQueue(data: 3)

        sut.clear()
        let result = sut.isEmpty

        XCTAssertTrue(result)
    }

    func test_enQueue_3번_후에_peek호출_결과가_1인지() {
        sut.enQueue(data: 1)
        sut.enQueue(data: 2)
        sut.enQueue(data: 3)

        let result = sut.peek

        XCTAssertEqual(result, 1)
    }

    func test_enQueue_3번_후에_deQueue호출후_peek한_결과가_2인지() {
        sut.enQueue(data: 1)
        sut.enQueue(data: 2)
        sut.enQueue(data: 3)

        _ = sut.deQueue()
        let result = sut.peek

        XCTAssertEqual(result, 2)
    }
}

fileprivate final class MockList<Element>: Listable {
    var list: [Element] = []

    var isEmpty: Bool {
        return list.isEmpty
    }

    var first: Element? {
        return list.first
    }

    func append(value: Element) {
        list.append(value)
    }

    func removeAll() {
        list.removeAll()
    }

    func removeFirst() -> Element? {
        return list.removeFirst()
    }
}
