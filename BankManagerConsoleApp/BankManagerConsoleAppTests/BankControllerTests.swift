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
        sut = BankController(of: bank, tellerNumber: 1)
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

        XCTAssertEqual(bank.customerQueue.queue[1].waitingNumber, 2)
    }

    func test_10명을_prepareTeller를_하면_창구에_10명이_들어가진다() {
        sut.employTeller(number: 10)

        XCTAssertEqual(10, bank.counters.count - 1)
    }

    func test_prepareTeller를_하면_은행원이_index와_같은_창구번호를_가진다() {
        sut.employTeller(number: 2)

        XCTAssertEqual(1, bank.counters[1].counterNumber + 1)
    }

    func test_openBank에_customer1명_teller1명_배치시_customerQueue의count가_0이되는가() {
        sut.openBank(customerNumber: 10)

        XCTAssertEqual(bank.customerQueue.queue.count, 0)
    }
}
