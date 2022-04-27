//
//  LinkedListTest.swift
//  LinkedListTest
//
//  Created by Eddy, dudu on 2022/04/25.
//

import XCTest

class LinkedListTest: XCTestCase {
    let sut: LinkedList<Int> = LinkedList<Int>()

    func test_처음생성했을때_LinkedList가_isEmpty여야한다() {
        XCTAssertTrue(sut.isEmpty)
    }

    func test_LinkedList에_값들을_append했을때_peek을_호출하면_처음append한값이나오고_LinkedList의_데이터가_변하지않는다() {
        // given
        sut.append(10)
        sut.append(20)

        // when
        let firstData = sut.peek
        let secondData = sut.peek

        // then
        XCTAssertEqual(firstData, 10)
        XCTAssertEqual(firstData, secondData)
    }

    func test_LinkedList가_비어있을때_peek를_호출하면_nil를_반환해야한다() {
        XCTAssertNil(sut.peek)
    }

    func test_LinkedList에_append를했을때_isEmpty가_false여야한다() {
        // when
        sut.append(10)

        // then
        XCTAssertFalse(sut.isEmpty)
    }

    func test_LinkedList에_값들을_append하고_removeFirst를_했을때_처음_append한값과_같아야한다() {
        // given
        sut.append(10)
        sut.append(20)
        sut.append(30)

        // when
        let data = sut.removeFirst()

        // then
        XCTAssertEqual(data, 10)
    }

    func test_LinkedList가_비어있을때_removeFirst를_호출하면_nil를_반환해야한다() {
        XCTAssertNil(sut.removeFirst())
    }

    func test_LinkedList에_한번_append하고_removeFirst를_호출하면_isEmpty가_나온다() {
        // given
        sut.append(10)

        // when
        let data = sut.removeFirst()

        // then
        XCTAssertEqual(data, 10)
        XCTAssertTrue(sut.isEmpty)
    }

    func test_LinkedList에_값들을_append하고_clear했을때_isEmpty가_true여야한다() {
        // given
        sut.append(10)
        sut.append(20)
        sut.append(30)

        // when
        sut.clear()

        // then
        XCTAssertTrue(sut.isEmpty)
    }
}
