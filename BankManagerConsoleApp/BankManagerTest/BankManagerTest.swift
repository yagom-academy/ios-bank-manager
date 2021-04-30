//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Yun, Ryan on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerTests: XCTestCase {
    private var sutBank: Bank?
    
    override func setUpWithError() throws {
        sutBank = Bank(numberOfTeller: 1)
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sutBank = nil
        
        try super.tearDownWithError()
    }

    func test_bank_clients() {
        let clients: [Client]? = sutBank?.clients()
        XCTAssertEqual(clients?.count, sutBank?.totalClient)
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
        guard let sleepTime: Double = sleepTime else {
            XCTFail("Failed to initialize sleepTime.")
            return
        }
        let flooredSleepTime: Double = floor(sleepTime * 100) / 100
        
        XCTAssertEqual(flooredSleepTime, 0.01)
    }
}
