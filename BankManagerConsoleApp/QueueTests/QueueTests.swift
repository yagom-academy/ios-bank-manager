//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by OneTool, Red on 2022/04/26.
//

import XCTest

class QueueTests: XCTestCase {
    var sut = Queue<Int>()

    func test_isEmpty() {
        sut.enQueue(data: 1)
        sut.enQueue(data: 2)
        sut.enQueue(data: 3)

        sut.clear()
        let result = sut.isEmpty

        XCTAssertTrue(result)
    }

    func test_peek() {
        sut.enQueue(data: 1)
        sut.enQueue(data: 2)
        sut.enQueue(data: 3)

        let result = sut.peek

        XCTAssertEqual(result, 1)
    }

    func test_deQueue() {
        sut.enQueue(data: 1)
        sut.enQueue(data: 2)
        sut.enQueue(data: 3)

        let result1 = sut.deQueue()
        let result2 = sut.peek

        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
    }
}
