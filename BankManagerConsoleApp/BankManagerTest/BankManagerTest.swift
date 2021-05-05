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
        var sutBank: Bank = Bank(numberOfTeller: 1)
        for lessThanOne in -1...0 {
            XCTAssertEqual(sutBank.makeClients(number: lessThanOne), [])
        }
    }
    
    func testMakeClients_whenClientNumberIsMoreThanOne_returnsClientsWithWaitingNumber() {
        var sutBank: Bank = Bank(numberOfTeller: 1)
        let sutClients: [Client] = sutBank.makeClients(number: 3)
        
        XCTAssertEqual(sutClients.count, 3)
        
        for index in 0...2 {
            XCTAssertEqual(sutClients[index].waitingNumber, index + 1)
        }
    }
    
    func testMeasureTime_whenNoTaskGiven_returnsZero() {
        let sutBank: Bank = Bank(numberOfTeller: 1)
        let processTime: Double = sutBank.measureTime { }
        
        XCTAssertEqual(floor(processTime), 0)
    }
    
    func testMeasureTime_whenProcessTimeIsGiven_returnsGivenTime() {
        let sutBank: Bank = Bank(numberOfTeller: 1)
        let processTime: Double = sutBank.measureTime { () -> Void in
            return Thread.sleep(forTimeInterval: 0.01)
        }
        
        XCTAssertEqual(floor(processTime * 100) / 100, 0.01)
    }
    
    func testProcessTasks_whenProcessOneDepositTask_takesPointSevenSeconds() {
        var sutBank: Bank = Bank(numberOfTeller: 1)
        let processTime: Double = sutBank.measureTime { () -> Void in
            let tasks: [BankingTask] = [Client(1, .normal, .deposit).bankingTask]
            return sutBank.process(tasks)
        }
        
        XCTAssertEqual(floor(processTime * 10) / 10 , 0.7)
    }
    
    func testPreferredNumberFormat_whenNumberMoreThanTwoDecimalPlacesIsGiven_returnsNumberWithTwoDecimalPlaces() {
        let sutBank: Bank = Bank(numberOfTeller: 1)
        XCTAssertEqual(sutBank.preferredNumberFormat(123.456789), 123.45)
    }

    func testStarttask_whenClientHasWaitingNumberOneNormalGradeDepositTask_returnAppropriateStartText() {
        let client: Client = Client(1, .normal, .deposit)
        XCTAssertEqual(try client.bankingTask.startTask(), "💸 1번 일반고객 예금업무 시작.")
    }

    func testEndTask_whenClientHasWaitingNumberOneNormalGradeDepositTask_returnAppropriateEndText() {
        let client: Client = Client(1, .normal, .deposit)
        XCTAssertEqual(try client.bankingTask.endTask(), "✅ 1번 일반고객 예금업무 완료!")
    }
    
    func testClose_whenNumberOfClientAndTotalProcessTimeAreGiven_returnCloseTextWithGivenNumbers() {
        let sutBank: Bank = Bank(numberOfTeller: 1)
        XCTAssertEqual(
            sutBank.close(numberOfClient: 3, 2.1),
            "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 3 명이며, 총 업무 시간은 2.1초입니다."
        )
    }
    
    func testMenuText_whenCalled_returnMenuText() {
        let sutBankManager: BankManager = BankManager(numberOfTeller: 1)
        
        XCTAssertEqual(sutBankManager.menuText(), "1: 은행 개점\n2: 종료\n입력: ")
    }
    
    func testMove_whenSelectedMenuIsOne_returnTrue() {
        var sutBankManager: BankManager = BankManager(numberOfTeller: 1)
        XCTAssertEqual(sutBankManager.move(to: "1"), true)
    }
    
    func testMove_whenSelectedMenuIsTwo_returnFalse() {
        var sutBankManager: BankManager = BankManager(numberOfTeller: 1)
        XCTAssertEqual(sutBankManager.move(to: "2"), false)
    }
    
    func testMove_whenSelectedMenuIsNotOneOrTwo_returnFalse() {
        var sutBankManager: BankManager = BankManager(numberOfTeller: 1)
        XCTAssertEqual(sutBankManager.move(to: "ryan"), false)
    }
    
    func testSortByGrade_whenNumberOfClientsIsThirty_returnSortedClients() {
        var sutBank: Bank = Bank(numberOfTeller: 1)
        var clients: [Client] = sutBank.makeClients(number: 30)
        clients = sutBank.sortByGrade(for: clients)
        
        for index in 0...(clients.count - 2) {
            XCTAssertEqual(clients[index].grade <= clients[index + 1].grade, true)
        }
    }
}
