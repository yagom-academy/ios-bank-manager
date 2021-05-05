//
//  BankManagerTests.swift
//  BankManagerTests
//
//  Created by Yun, Ryan on 2021/04/27.
//

import XCTest
@testable import BankManagerConsoleApp

final class BankManagerTests: XCTestCase {
    var sutBank: Bank = Bank(numberOfTeller: 1)
    
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
        let processTime: Double = sutBank.measureTime { }
        
        XCTAssertEqual(floor(processTime), 0)
    }
    
    func testMeasureTime_whenProcessTimeIsGiven_returnsGivenTime() {
        let processTime: Double = sutBank.measureTime { () -> Void in
            return Thread.sleep(forTimeInterval: 0.01)
        }
        
        XCTAssertEqual(floor(processTime * 100) / 100, 0.01)
    }
    
    func testProcessTasks_whenProcessOneDepositTask_takesPointSevenSeconds() {
       
        let processTime: Double = sutBank.measureTime { () -> Void in
            let clients: [Client] = [Client(1)]
            return sutBank.processTasks(of: clients)
        }
        
        XCTAssertEqual(floor(processTime * 100) / 100 , 0.7)
    }
    
    func testPreferredNumberFormat_whenNumberMoreThanTwoDecimalPlacesIsGiven_returnsNumberWithTwoDecimalPlaces() {
        XCTAssertEqual(sutBank.preferredNumberFormat(123.456789), 123.45)
    }

    func testStarttask_whenClientHasWaitingNumberOne_returnStartTaskTextWithWaitingNumberOne() {
        let client: Client = Client(1)
        XCTAssertEqual(client.startTask(), "1 번 고객 업무 시작.")
    }

    func testEndTask_whenClientHasWaitingNumberOne_returnEndTaskTextWithWaitingNumberOne() {
        let client: Client = Client(1)
        XCTAssertEqual(client.endTask(), "1 번 고객 업무 종료!")
    }
    
    func testClose_whenNumberOfClientAndTotalProcessTimeAreGiven_returnCloseTextWithGivenNumbers() {
        XCTAssertEqual(
            sutBank.close(numberOfClient: 3, 2.1),
            "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 3 명이며, 총 업무 시간은 2.1초입니다."
        )
    }
    
    func testMenuText_whenCalled_returnMenuText() {
        let bankManager: BankManager = BankManager(numberOfTeller: 1)
        
        XCTAssertEqual(bankManager.menuText(), "1: 은행 개점\n2: 종료\n입력: ")
    }
}
