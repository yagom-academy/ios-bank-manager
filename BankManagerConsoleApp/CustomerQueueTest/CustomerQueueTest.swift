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
}
