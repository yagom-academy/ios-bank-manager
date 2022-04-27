//
//  QueueTest.swift
//  LinkedListTest
//
//  Created by Eddy, dudu on 2022/04/25.
//

import XCTest

class QueueTest: XCTestCase {
    let sut = Queue<Int>()

    func test_Queue에_enqueue하면_isEmpty가_false로_나온다() {
        // when
        sut.enqueue(10)

        // then
        XCTAssertFalse(sut.isEmpty)
    }

    func test_Queue에_enqueue하나하고_dequeue하면_dequeue한값이_enqueue한값과_동일하다() {
        // given
        sut.enqueue(10)

        // when
        let data = sut.dequeue()

        // then
        XCTAssertEqual(data, 10)
    }

    func test_Queue가_비어있을때_dequeue하면_nil이나온다() {
        XCTAssertNil(sut.dequeue())
    }

    func test_Queue에_값들을_enqueue하고_dequeue를_했을때_값이_두번쨰_enqueue한값과_달라야한다() {
        // given
        sut.enqueue(10)
        sut.enqueue(20)
        sut.enqueue(30)

        // when
        let data = sut.dequeue()

        // then
        XCTAssertEqual(data, 10)
        XCTAssertNotEqual(data, 20)
    }

    func test_Queue에_enqueue_2번하고_clear하면_isEmpty가_true로_나온다() {
        // given
        sut.enqueue(10)
        sut.enqueue(20)

        // when
        sut.clear()

        // then
        XCTAssertTrue(sut.isEmpty)
    }

    func test_Queue에_enqueue_2번하고_peek하면_첫번째enqueue값이_peek값과_같다() {
        // given
        sut.enqueue(10)
        sut.enqueue(20)

        // when
        let data = sut.peek

        // then
        XCTAssertEqual(data, 10)
    }

    func test_Queue가_비어있을때_peek을_호출하면_nil이나온다() {
        XCTAssertNil(sut.peek)
    }

    func test_Queue에_값들을_enqueue했을때_peek을_호출하면_처음enqueue한값이나오고_Queue의_데이터가_변하지않는다() {
        // given
        sut.enqueue(10)
        sut.enqueue(20)

        // when
        let firstData = sut.peek
        let secondData = sut.peek

        // then
        XCTAssertEqual(firstData, 10)
        XCTAssertEqual(firstData, secondData)
    }
}
