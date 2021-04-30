//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Yun, Ryan on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerTests: XCTestCase {
    var sutBank: Bank = Bank()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testMakeClients_whenClientNumberLessThanOne_returnsEmptyArray() {
        for lessThanOne in -1...0 {
            XCTAssertEqual(sutBank.makeClients(number: lessThanOne), [])
        }
    }
    
    func testMakeClients_whenClientNumberIsMoreThanOne_returnsClientsWithWaitingNumber() {
        let sutClients: [Client] = sutBank.makeClients(number: 3)
        
        XCTAssertEqual(sutClients.count, 3)
        
        for index in 0...2 {
            XCTAssertEqual(sutClients[index].waitingNumber, index + 1)
        }
    }
    
    func testMeasureTime_whenNoTaskGiven_returnsZero() {
        let sleepTime: Double = sutBank.measureTime { }
        
        XCTAssertEqual(sleepTime, 0)
    }
    
    func testMeasureTime_whenProcessTimeIsGiven_returnsGivenTime() {
        let sleepTime: Double = sutBank.measureTime {
            Thread.sleep(forTimeInterval: 0.01)
        }
        
        XCTAssertEqual(floor(sleepTime * 100) / 100, 0.01)
    }
    
    func testProcessTasks_whenProcessOneDepositTask_takesPointSevenSeconds() {
        let processTime: Double = sutBank.measureTime {
            sutBank.processTasks(of: [Client(1)])
        }
        
        XCTAssertEqual(floor(processTime * 100) / 100 , 0.7)
    }
    
    func testPreferredNumberFormat_whenNumberMoreThanTwoDecimalPlacesIsGiven_returnsNumberWithTwoDecimalPlaces() {
        XCTAssertEqual(sutBank.preferredNumberFormat(123.456789), 123.45)
    }
}
