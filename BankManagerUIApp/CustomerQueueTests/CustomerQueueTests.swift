//
//  CustomerQueueTests.swift
//  CustomerQueueTests
//
//  Created by Kiseok on 11/14/23.
//

import XCTest
@testable import BankManagerUIApp

final class CustomerQueueTests: XCTestCase {
    var sut: CustomerQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CustomerQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

}
