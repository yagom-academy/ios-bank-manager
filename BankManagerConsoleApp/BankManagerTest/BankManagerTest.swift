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

    func testMakeClients_whenClientNumberLessThanOne_returnsEmptyArray() {
        var sutBank: Bank = Bank()
        
        for lessThanOne in -1...0 {
            XCTAssertEqual(sutBank.makeClients(number: lessThanOne), [])
        }
    }
    
    func testMakeClients_whenClientNumberIsMoreThanOne_returnsClientsWithWaitingNumber() {
        var sutBank: Bank = Bank()
        let sutClients: [Client] = sutBank.makeClients(number: 3)
        
        XCTAssertEqual(sutClients.count, 3)
        
        for index in 0...2 {
            XCTAssertEqual(sutClients[index].waitingNumber, index + 1)
        }
    }
    
    func testMeasureTime_whenProcessTimeIsGiven_returnsGivenTime() {
        let sutBank: Bank = Bank()
        let sleepTime: Double = sutBank.measureTime {
            Thread.sleep(forTimeInterval: 0.01)
        }
        
        XCTAssertEqual(sleepTime, 0.01)
    }
    
    func testProcessTasks_whenProcessOneDepositTask_takesPointSevenSeconds() {
        var sutBank: Bank = Bank()
        let processTime: Double = sutBank.measureTime {
            sutBank.processTasks(of: [Client(1)])
        }
        
        XCTAssertEqual(processTime, 0.7)
    }
}
