//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Yunhwa on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerTests: XCTestCase {
    private var sutBank: Bank?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sutBank = Bank(numberOfTeller: 1)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_bank_visitNewCustomer() {
        let customers: [Customer]? = sutBank?.visitNewCustomer()
        XCTAssertEqual(customers?.count, sutBank?.totalCustomer)
    }

    func test_bank_assignTeller() {
        sutBank?.assignTeller()
        XCTAssertEqual(sutBank?.waitingQueue.maxConcurrentOperationCount, sutBank?.numberOfTeller)
    }
    
    func test_bank_close() {
        sutBank?.processedTime = 123.56789
        XCTAssertEqual(sutBank?.close(), 123.56)
    }
    
    func test_bank_totalProcessedTime() {
        let sleepTime: Double? = sutBank?.totalProcessedTime {
            Thread.sleep(forTimeInterval: 0.01)
        }
        guard let sleepTime = sleepTime else {
            XCTFail("Failed to initialize sleepTime.")
            return
        }
        
        XCTAssertEqual(floor(sleepTime * 100) / 100, 0.01)
    }
}
