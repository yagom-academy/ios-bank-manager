//
//  BankModuleTest.swift
//  BankModuleTest
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import XCTest
@testable import BankManagerConsoleApp

class BankModuleTest: XCTestCase {
    var bank: Bank!
    var minClient = 10
    var maxClient = 10
    var clerkCount = 1
    var spendingTimeForAClient: Double = 2

    override func setUpWithError() throws {
        bank = Bank(clientQueue: <#T##Queue<Client>#>)
    }

    override func tearDownWithError() throws {
        bank = nil
    }

    func test_bank_total_count() throws {
        let expectResultClient = 10
        let expectResultTime: Double = 20
        bank.startWork()
        XCTAssertEqual(expectResultClient, bank.finishedClientCount)
        XCTAssertEqual(expectResultTime, bank.totalWorkingTime)
    }
}
