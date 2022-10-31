//
//  CustomerQueueTest.swift
//  CustomerQueueTest
//
//  Created by jin on 10/31/22.
//

import XCTest
@testable import BankManagerConsoleApp

final class CustomerQueueTest: XCTestCase {
    var sut: CustomerQueue<String>!
    let one = "Aaron"
    let two = "Aladin"
    let three = "Tottale"
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_customerQueue에_one을_enqueue_했을_때_Aaron이_들어가는지() throws {
        sut.enqueue(one)
        let result = sut.dequeue()
        XCTAssertEqual(result, "Aaron")
    }
    
    func test_one을_deque했을_때_Aaron이_나오는지() {
        sut.customerList.head = Node(one)
        let result = sut.dequeue()
        XCTAssertEqual(result, "Aaron")
    }
    
    func test_값이_없을때_isEmpty가_true를_반환하는지() {
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_값이_있을때_isEmpty가_false를_반환하는지() {
        sut.enqueue(one)
        let result = sut.isEmpty
        XCTAssertFalse(result)
    }
    
    func test_clear했을_때_isEmpty가_true인지() {
        sut.enqueue(one)
        sut.enqueue(two)
        sut.enqueue(three)
        sut.clear()
        let result = sut.isEmpty
        XCTAssertTrue(result)
    }
    
    func test_peek을_했을_때_Tottale가_나오는지() {
        sut.enqueue(three)
        sut.enqueue(one)
        sut.enqueue(two)
        let result = sut.peek()
        XCTAssertEqual(result, "Tottale")
    }
}
