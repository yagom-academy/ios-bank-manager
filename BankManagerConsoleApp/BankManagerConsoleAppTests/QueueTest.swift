//
//  QueueTest.swift
//  BankManagerConsoleAppTests
//
//  Created by 조민호 on 2022/04/25.
//

import XCTest

class QueueTest: XCTestCase {
    var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue<Int>()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_queue가_비어있을때_isEmpty가_true를_반환해야한다() {
        // given
        // when
        // then
        XCTAssertTrue(sut.isEmpty)
    }

    func test_enqueue를_한번했을때_peek값은_enqueue한값과_같아야한다() {
        // given
        let input = 1
        
        // when
        sut.enqueue(input)
        
        // then
        let result = sut.peek
        XCTAssertEqual(input, result)
    }
    
    func test_enqueue를두번하고_dequeue를두번했을때_isEmpty가_true를_반환해야한다() {
        // given
        let input = [1,2]

        // when
        input.forEach {
            sut.enqueue($0)
        }
        
        input.forEach { _ in
            sut.dequeue()
        }

        // then
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }

    func test_queue가비어있을때_dequeue를하면_nil을반환해야한다() {
        // given
        // when
        // then
        let result = sut.dequeue()
        XCTAssertEqual(nil, result)
    }

    func test_clear를했을때_isEmpty는_true이여야한다() {
        // given
        let input = [1,2]

        // when
        input.forEach {
            sut.enqueue($0)
        }
        sut.clear()

        // then
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
}
