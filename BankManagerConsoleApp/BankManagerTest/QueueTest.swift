//
//  QueueTest.swift
//  LinkedListTest
//
//  Created by Eddy, dudu on 2022/04/25.
//

import XCTest

class QueueTest: XCTestCase {
    var sut: Queue<Int>!

    override func setUpWithError() throws {
        let list = LinkedList<Int>()
        sut = Queue<Int>(list: list)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

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
}
