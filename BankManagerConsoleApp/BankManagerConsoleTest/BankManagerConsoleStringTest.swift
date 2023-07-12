//
//  BankManagerConsoleStringTest.swift
//  BankManagerConsoleTest
//
//  Created by kyungmin, Max on 2023/07/10.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerConsoleStringTest: XCTestCase {
    var sut: MockCustomerQueue<String>!

    override func setUpWithError() throws {
        sut = MockCustomerQueue<String>()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_isEmpty가_true일때_enqueue를_사용해_문자를_넣으면_tailNode와_headNode가_동일한_객체인지_확인() {
        //given
        sut.enqueue("A")

        //when
        let head = sut.headNode
        let tail = sut.tailNode

        //then
        XCTAssertIdentical(head, tail)
    }

    func test_enqueue를_사용해_문자를_넣으면_tailNode의_value프로퍼티에_저장되는지_확인() {
        //given
        let testValue = "A"
        sut.enqueue(testValue)

        //when
        let result = sut.tailNode?.element

        //then
        XCTAssertEqual(testValue, result)
    }

    func test_clear를_사용하면_headNode와_tailNode가_모두_nil이_되는지_확인() {
        //given
        sut.enqueue("A")

        //when
        sut.clear()

        //then
        XCTAssertNil(sut.headNode)
        XCTAssertNil(sut.tailNode)
    }

    func test_isEmpty가_false일때_dequeue를_사용하면_headNode의_value프로퍼티가_반환_되는지_확인() {
        //given
        let testValue = "A"
        sut.enqueue(testValue)

        //when
        let result = sut.dequeue()

        //then
        XCTAssertEqual(testValue, result)
    }

    func test_isEmpty가_false일때_dequeue를_사용하면_headNode가_nextNode로_변경되는지_확인() {
        //given
        sut.enqueue("A")
        sut.enqueue("B")

        //when
        let expected = sut.headNode?.nextNode
        sut.dequeue()

        //then
        XCTAssertIdentical(sut.headNode, expected)
    }

    func test_isEmpty가_false일때_peek을_사용하면_headNode의_value프로퍼티가_반환_되는지_확인() {
        //given
        sut.enqueue("A")

        //when
        let result = sut.peek()
        let headValue = sut.headNode?.element

        //then
        XCTAssertEqual(result, headValue)
    }
}
