//
//  BankControllerTests.swift
//  BankManagerConsoleAppTests
//
//  Created by musun129 on 2021/04/30.
//

import XCTest

class BankControllerTests: XCTestCase {
    var bank: Bank!
    var sut: BankController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        bank = Bank()
        sut = BankController(of: bank)
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
        sut = nil
        bank = nil
    }

    func test_customer2명이찾아왔을때_customerQueue의_count가_2가되는가() {
        sut.receiveCustomer(number: 2)

        XCTAssertEqual(bank.customerQueue.queue.count, 2)
    }

    func test_customer2명이찾아왔을떄_두번째cutomer의_waitingNumber가_1이되는가() {
        sut.receiveCustomer(number: 2)

        XCTAssertEqual(bank.customerQueue.queue[1].waitingNumber, 1)
    }
}
