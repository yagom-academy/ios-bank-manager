//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by 김태훈 on 2022/04/26.
//

import XCTest
@testable import BankManagerConsoleApp

class LinkedListTests: XCTestCase {
    var sut = LinkedList<Int>()

    func test_isEmpty() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)

        sut.removeAll()
        let result = sut.isEmpty

        XCTAssertTrue(result)
    }

    func test_peek() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)

        let result = sut.peek

        XCTAssertEqual(result, 1)
    }

    func test_deQueue() {
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)

        let result1 = sut.pop()
        let result2 = sut.peek

        XCTAssertEqual(result1, 1)
        XCTAssertEqual(result2, 2)
    }
}
