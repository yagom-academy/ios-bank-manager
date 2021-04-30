//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Yun, Ryan on 2021/04/27.
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

    func testClients_whenInitiated_checksArrayAndNumberAreSame() {
        var sutBank: Bank = Bank(numberOfTeller: 1)
        let clients: [Client] = sutBank.clients()
        
        XCTAssertEqual(clients.count, sutBank.totalClient)
    }

    func testAssignTeller_whenThreeTellers_checksAssignedState() {
        let sutBank: Bank = Bank(numberOfTeller: 3)
        
        sutBank.assignTeller()
        
        XCTAssertEqual(sutBank.waitingQueue.maxConcurrentOperationCount, 3)
        XCTAssertEqual(sutBank.numberOfTeller, 3)
    }
    
    func testClose_whenProcessedTimeHasMoreThanTwoDecimalPlaces_checksResultHasTwoDecimalPlaces() {
        var sutBank: Bank = Bank(numberOfTeller: 1)
        
        sutBank.processedTime = 123.56789
        XCTAssertEqual(sutBank.close(), 123.56)
    }
    
    func testTotalProcessedTime_whenGivenProcessingTime_checksGivenValueAndCalculatedResultAreSame() {
        let sutBank: Bank = Bank(numberOfTeller: 1)
        let sleepTime: Double = sutBank.totalProcessedTime {
            Thread.sleep(forTimeInterval: 0.01)
        }
        
        XCTAssertEqual(floor(sleepTime * 100) / 100, 0.01)
    }
}
