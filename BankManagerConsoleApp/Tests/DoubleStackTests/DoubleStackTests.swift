//
//  DoubleStackTests.swift
//  DoubleStackTests
//
//  Created by OneTool, Red on 2022/04/27.
//

import XCTest

class DoubleStackTests: XCTestCase {
    var sut: DoubleStack<Int>!

    override func setUp() {
        sut = DoubleStack<Int>()
    }

    override func tearDown() {
        self.sut = nil
    }

    func test_append_3번_후에_isEmpty호출_removeAll호출_결과가_true인지() {
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)

        sut.removeAll()
        let result = sut.isEmpty

        XCTAssertTrue(result)
    }

    func test_append_3번_후에_first호출_결과가_1인지() {
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)

        let result = sut.first

        XCTAssertEqual(result, 1)
    }

    func test_append_3번_후에_removeFirst호출_first호출_결과가_2인지() {
        sut.append(value: 1)
        sut.append(value: 2)
        sut.append(value: 3)

        _ = sut.removeFirst()
        let result = sut.first

        XCTAssertEqual(result, 2)
    }
}
