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
        var sutLocalBank: LocalBank = LocalBank(numberOfTeller: 1)
        for lessThanOne in -1...0 {
            XCTAssertEqual(sutLocalBank.makeClients(number: lessThanOne), [])
        }
    }
    
    func testMakeClients_whenClientNumberIsMoreThanOne_returnsClientsWithWaitingNumber() {
        var sutLocalBank: LocalBank = LocalBank(numberOfTeller: 1)
        let sutClients: [Client] = sutLocalBank.makeClients(number: 3)
        
        XCTAssertEqual(sutClients.count, 3)
        
        for index in 0...2 {
            XCTAssertEqual(sutClients[index].waitingNumber, index + 1)
        }
    }
    
    func testMeasureTime_whenNoTaskGiven_returnsZero() {
        let sutLocalBank: LocalBank = LocalBank(numberOfTeller: 1)
        let processTime: Double = sutLocalBank.measureTime { }
        
        XCTAssertEqual(floor(processTime), 0)
    }
    
    func testMeasureTime_whenProcessTimeIsGiven_returnsGivenTime() {
        let sutLocalBank: LocalBank = LocalBank(numberOfTeller: 1)
        let processTime: Double = sutLocalBank.measureTime { () -> Void in
            return Thread.sleep(forTimeInterval: 0.01)
        }
        
        XCTAssertEqual(floor(processTime * 100) / 100, 0.01)
    }
    
    func testProcessTasks_whenProcessOneDepositTask_takesPointSevenSeconds() {
        var sutLocalBank: LocalBank = LocalBank(numberOfTeller: 1)
        let processTime: Double = sutLocalBank.measureTime { () -> Void in
            let tasks: [BankingTask] = [Client(1, grade: .normal, task: .deposit).bankingTask]
            return sutLocalBank.process(tasks)
        }
        
        XCTAssertEqual(floor(processTime * 10) / 10 , 0.7)
    }
    
    func testPreferredNumberFormat_whenNumberMoreThanTwoDecimalPlacesIsGiven_returnsNumberWithTwoDecimalPlaces() {
        let sutLocalBank: LocalBank = LocalBank(numberOfTeller: 1)
        XCTAssertEqual(sutLocalBank.getPreferredNumberFormat(123.456789), 123.45)
    }

    func testStarttask_whenClientHasWaitingNumberOneNormalGradeDepositTask_returnAppropriateStartText() {
        let sutLocalBank: Client = Client(1, grade: .normal, task: .deposit)
        XCTAssertEqual(try sutLocalBank.bankingTask.startTask(), "🏦 1번 일반고객 예금업무 시작.")
    }

    func testEndTask_whenClientHasWaitingNumberOneNormalGradeDepositTask_returnAppropriateEndText() {
        let client: Client = Client(1, grade: .normal, task: .deposit)
        XCTAssertEqual(try client.bankingTask.endTask(), "✅ 1번 일반고객 예금업무 완료!")
    }
    
    func testRejectLoanExecution_whenClientHasWaitingNumberOneNormalGrade_returnAppropriateText() {
        let client: Client = Client(1, grade: .normal, task: .loan)
        XCTAssertEqual(
            try client.bankingTask.rejectLoanExecution(),
            "❌ 1번 일반고객의 대출이 거절되었습니다."
        )
    }
    
    func testStartTask_whenOwnerNotAssignedToBankingTask_throwError() {
        let sutBankingTask: BankingTask = BankingTask(.deposit)
        
        XCTAssertThrowsError(try sutBankingTask.startTask()) { error in
            XCTAssertEqual(error as? BankManagerError, .ownerNotAssigned)
        }
    }

    func testEndTask_whenOwnerNotAssignedToBankingTask_throwError() {
        let sutBankingTask: BankingTask = BankingTask(.deposit)
        
        XCTAssertThrowsError(try sutBankingTask.endTask()) { error in
            XCTAssertEqual(error as? BankManagerError, .ownerNotAssigned)
        }
    }
    
    func testRejectLoanExecution_whenOwnerNotAssignedToBankingTask_throwError() {
        let sutBankingTask: BankingTask = BankingTask(.deposit)
        
        XCTAssertThrowsError(try sutBankingTask.startTask()) { error in
            XCTAssertEqual(error as? BankManagerError, .ownerNotAssigned)
        }
    }
    
    func testClose_whenNumberOfClientAndTotalProcessTimeAreGiven_returnCloseTextWithGivenNumbers() {
        let sutLocalBank: LocalBank = LocalBank(numberOfTeller: 1)
        XCTAssertEqual(
            sutLocalBank.close(numberOfClient: 3, 2.1),
            "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 3 명이며, 총 업무 시간은 2.1초입니다."
        )
    }
    
    func testMenuText_whenCalled_returnMenuText() {
        let sutBankManager: BankManager = BankManager(numberOfTeller: 1)
        
        XCTAssertEqual(sutBankManager.getMenuText(), "1: 은행 개점\n2: 종료\n입력: ")
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
        var sutLocalBank: LocalBank = LocalBank(numberOfTeller: 1)
        var clients: [Client] = sutLocalBank.makeClients(number: 30)
        clients = sutLocalBank.sortByGrade(for: clients)
        
        for index in 0...(clients.count - 2) {
            XCTAssertEqual(clients[index].grade <= clients[index + 1].grade, true)
        }
    }
    
    func testStartLoanScreening_whenClientHasWaitingNumberOneAndNormalGrade_returnAppropriateText() {
        let sutClient: Client = Client(1, grade: .normal, task: .loan)
        
        XCTAssertEqual(
            BankHeadquarter.startLoanScreening(of: sutClient),
            "🧾 1번 일반고객 대출심사 시작."
        )
    }
    
    func testEndLoanScreening_whenClientHasWaitingNumberOneAndNormalGrade_returnAppropriateText() {
        let sutClient: Client = Client(1, grade: .normal, task: .loan)
        
        XCTAssertEqual(
            BankHeadquarter.endLoanScreening(of: sutClient),
            "👍 1번 일반고객 대출심사 완료!"
        )
    }
}
