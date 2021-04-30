//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Yunhwa on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_visitNewCustomer() {
        var bank = Bank(1)
        let customers: [Customer] = bank.visitNewCustomer()
        XCTAssertEqual(customers.count, bank.totalCustomer)
    }

    func test_assignTeller() {
        let bank = Bank(1)
        bank.assignTeller()
        XCTAssertEqual(bank.waitingQueue.maxConcurrentOperationCount, bank.numberOfTeller)
    }
}
