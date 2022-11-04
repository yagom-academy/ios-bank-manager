//
//  QueueTests.swift
//  BankManagerTests

import XCTest

final class QueueTests: XCTestCase {
    var sut: Queue<Double>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Queue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_Double타입의값을enqueue했을때_queue의첫번째요소가_enqueue한값이어야한다() {
        // given
        sut.enqueue(10.0)
        // when
        let result = sut.queue.head?.value
        // then
        XCTAssertEqual(result, 10.0)
    }
    
    func test_비어있는Queue에_isEmpty를호출했을때_true가나와야한다() {
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_Double타입의값을enqueue한후_clear를호출하면_전부삭제돼야한다() {
        // given
        sut.enqueue(10.0)
        sut.enqueue(20.0)
        sut.enqueue(30.0)
        sut.clear()
        // when
        let result = sut.isEmpty
        // then
        XCTAssertTrue(result)
    }
    
    func test_Queue가비었을때_dequeue를하면_nil이나와야한다() {
        // when
        let result = sut.dequeue()
        // then
        XCTAssertNil(result)
    }
    
    func test_Double타입의값을enqueue한후_dequeue를했을때_enqueue한값반환되어야한다() {
        // given
        sut.enqueue(10.0)
        // when
        let result = sut.dequeue()
        // then
        XCTAssertEqual(result, 10.0)
    }
}
